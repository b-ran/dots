LAYOUT_DIR="$HOME/.config/waybar/layouts"

CURRENT_LAYOUT="$HOME/.config/waybar/current-layout"

LAYOUTS=$(ls $LAYOUT_DIR)

SELECTED_LAYOUT=$(echo "$LAYOUTS" | rofi -dmenu -theme-str 'entry { placeholder: " Select a waybar layout "; }' -theme ~/.config/rofi/themes/single.rasi)

# If the user selected a layout
if [ -n "$SELECTED_LAYOUT" ]; then
    # Replace the current layout with the selected one
    cp "$LAYOUT_DIR/$SELECTED_LAYOUT" "$CURRENT_LAYOUT"

    # Restart waybar
    pkill -u $USER waybar || true
    nohup waybar &>/dev/null &
fi