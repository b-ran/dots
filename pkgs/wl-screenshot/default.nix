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
  if [ "$1" = "--copy" ]; then
    ${_ grim} -g "$(${_ slurp} -d -c '#FFFFFFFF')" - | tee "$TEMP" | ${wl-clipboard}/bin/wl-copy --type image/png
  else
    ${_ grim} -g "$(${_ slurp} -d -c '#FFFFFFFF')" - | tee "$TEMP" | ${_ satty} --filename -
  fi
  ${libnotify}/bin/notify-send -i "$TEMP" "Screenshot:" "Captured selected area"
  rm "$TEMP"
  ''
