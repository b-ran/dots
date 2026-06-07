{
  writeShellScriptBin,
  lib,
  grim,
  slurp,
  tesseract,
  wl-clipboard,
  libnotify,
}: let
  _ = lib.getExe;
in
  writeShellScriptBin "wl-ocr" ''
  TEMP=$(mktemp /tmp/XXXXXX.png)
  ${_ grim} -g "$(${_ slurp} -d -c '#FFFFFFFF')" - | tee "$TEMP" | ${_ tesseract} - - | ${wl-clipboard}/bin/wl-copy
  ${libnotify}/bin/notify-send -i "$TEMP" "OCR:" "Text has been copied to the clipboard."
  rm "$TEMP"
  ''
