{
  stdenv,
  lib,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  libusb1,
  libdrm,
  pkg-config,
  unzip,
}:

stdenv.mkDerivation rec {
  pname = "smi-usb-display";
  version = "4.5.2.0";

  src = fetchurl {
    url = "https://files2.wavlink.com/drivers/driver/SMI-USB-Display-for-Linux-v4.5.2.0-0403.zip";
    hash = "sha256-aWOO8yEnyzIDTTHir6Rub9pT9be4BGiiyy7gdQ29m0Q=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    pkg-config
    unzip
  ];

  # autoPatchelfHook resolves binary's needed libs from these
  buildInputs = [
    libdrm # headers for evdi library build
    libusb1 # libusb-1.0.so.0 runtime dep
    stdenv.cc.cc.lib # libstdc++.so.6, libgcc_s.so.1
  ];

  # Unpack the zip then extract the Makeself payload without running it
  unpackPhase = ''
    unzip $src
    sh SMIUSBDisplay-driver.4.5.2.0.run --noexec --target smi-src
    cd smi-src
  '';

  buildPhase = ''
    # Extract evdi sources and build only the userspace library
    mkdir evdi-src
    tar xzf evdi.tar.gz -C evdi-src
    cd evdi-src/library
    make
    cd ../..
  '';

  installPhase = ''
    runHook preInstall

    local out_pkg=$out/lib/smi-usb-display
    mkdir -p "$out_pkg" "$out/lib" "$out/bin"

    # Pre-built display manager binary (patched by autoPatchelfHook)
    install -m 0755 x64/SMIUSBDisplayManager "$out_pkg/"

    # evdi userspace library built from bundled 1.14.11 source.
    # Placed in $out/lib so autoPatchelfHook picks it up for the binary's RPATH.
    install -m 0755 evdi-src/library/libevdi.so.1.14.11 "$out/lib/libevdi.so.1.14.11"
    ln -sf libevdi.so.1.14.11 "$out/lib/libevdi.so.1"
    ln -sf libevdi.so.1 "$out/lib/libevdi.so"

    # Firmware blobs
    install -m 0644 Bootloader0.bin Bootloader1.bin USBDisplay.bin USBDisplay770.bin \
      firmware0.bin "$out_pkg/"

    # Udev helper script (called by udev rules on device plug/unplug)
    cat > "$out_pkg/smi-udev.sh" <<'EOF'
#!/bin/sh
start_service() { systemctl start smiusbdisplay; }
stop_service()  { systemctl stop  smiusbdisplay; }

create_smi_symlink() {
  root="$1" device_id="$2" devnode="$3"
  mkdir -p "$root/siliconmotion/by-id"
  ln -sf "$devnode" "$root/siliconmotion/by-id/$device_id"
}

unlink_smi_symlink() {
  root="$1" devname="$2"
  for f in "$root/siliconmotion/by-id/"*; do
    { [ ! -e "$f" ] || { [ -L "$f" ] && [ "$f" -ef "$devname" ]; }; } \
      && unlink "$f" 2>/dev/null || true
  done
  (cd "$root" && rmdir -p --ignore-fail-on-non-empty siliconmotion/by-id 2>/dev/null || true)
}

action="$1" root="$2"
case "$action" in
  add)    create_smi_symlink "$root" "$3" "$4"; start_service ;;
  remove) unlink_smi_symlink "$root" "$3" ;;
  START)  start_service ;;
esac
EOF
    chmod 0755 "$out_pkg/smi-udev.sh"

    # Wrapper that runs the binary from its directory so relative firmware paths resolve
    makeWrapper "$out_pkg/SMIUSBDisplayManager" "$out/bin/SMIUSBDisplayManager" \
      --chdir "$out_pkg"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Silicon Motion USB display driver (SMI USB Display Manager)";
    homepage = "https://www.wavlink.com/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "SMIUSBDisplayManager";
  };
}
