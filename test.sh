PID_FILE="/tmp/wf-recorder.pid"
RECORDINGS_DIR="$HOME/Recordings"
mkdir -p "$RECORDINGS_DIR"

start_recording() {
    WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
    WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))')"
    GEOMETRY="$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)"

    wf-recorder --audio -g "$GEOMETRY" --file "$RECORDINGS_DIR/$(date +%Y%m%d_%H%M%S).mp4" &

    echo $! > "$PID_FILE"
    notify-send "Recording started" "Recording area: $GEOMETRY"
}

stop_recording() {
    if [ -f "$PID_FILE" ]; then
        kill $(cat "$PID_FILE")
        rm "$PID_FILE"
        notify-send "Recording stopped" "The recording has been successfully stopped."
    else
        notify-send "Error" "No recording is currently active."
    fi
}


if [ -f "$PID_FILE" ]; then
    stop_recording
else
    start_recording
fi
