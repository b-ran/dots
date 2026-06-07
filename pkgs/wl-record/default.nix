{
  writeShellScriptBin,
  lib,
  slurp,
  wf-recorder,
  libnotify,
  wl-clipboard,
}: let
  _ = lib.getExe;
in
  writeShellScriptBin "wl-record" ''

  PID_FILE="/tmp/wf-recorder.pid"
  FILE_PATH="/tmp/wf-recorder.file"
  RECORDINGS_DIR="$HOME/Recordings"
  mkdir -p "$RECORDINGS_DIR"

  start_recording() {
      WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
      WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))')"
      GEOMETRY="$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | ${_ slurp} -d -c "#FFFFFFFF" -s "#FFFFFF40" -b "#00000050")"

      [ -z "$GEOMETRY" ] && exit 1

      OUTPUT="$RECORDINGS_DIR/$(date +%Y%m%d_%H%M%S).mp4"
      echo "$OUTPUT" > "$FILE_PATH"

      ${_ wf-recorder} --audio -g "$GEOMETRY" --file "$OUTPUT" &

      echo $! > "$PID_FILE"
      ${libnotify}/bin/notify-send "Recording started" "Recording area: $GEOMETRY"
  }

  stop_recording() {
      if [ -f "$PID_FILE" ]; then
          kill $(cat "$PID_FILE")
          rm "$PID_FILE"
          if [ -f "$FILE_PATH" ]; then
              OUTPUT="$(cat "$FILE_PATH")"
              rm "$FILE_PATH"
              printf "file://%s" "$OUTPUT" | ${wl-clipboard}/bin/wl-copy --type text/uri-list
              ${libnotify}/bin/notify-send "Recording stopped" "Saved to $OUTPUT\nPath copied to clipboard"
          else
              ${libnotify}/bin/notify-send "Recording stopped" "The recording has been successfully stopped."
          fi
      else
          ${libnotify}/bin/notify-send "Error" "No recording is currently active."
      fi
  }

  if [ -f "$PID_FILE" ]; then
      stop_recording
  else
      start_recording
  fi
  ''
