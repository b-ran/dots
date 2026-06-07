{
  writeShellScriptBin,
  lib,
  grim,
  slurp,
  satty,
  wl-clipboard,
  libnotify,
}: let
  _ = lib.getExe;
in
  writeShellScriptBin "wl-screenshot" ''
  TEMP=$(mktemp /tmp/XXXXXX.png)
  ${_ grim} -g "$(${_ slurp} -d -c '#FFFFFFFF')" - | tee "$TEMP" | ${_ satty} --filename - | ${wl-clipboard}/bin/wl-copy
  ${libnotify}/bin/notify-send -i "$TEMP" "Screenshot:" "Captured selected area"
  rm "$TEMP"
  ''
