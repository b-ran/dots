custom_dir="$HOME/.config/wal/colorschemes/dark/"

declare -A themes

for file in "$custom_dir"/*.json; do
  filename=$(basename -- "$file")
  filename="${filename%.*}"
  themes["$filename"]="$file"
done

sorted_themes=($(printf '%s\n' "${!themes[@]}" | sort))

selected_theme=$(printf '%s\n' "${sorted_themes[@]}" | rofi -dmenu -theme-str 'entry { placeholder: " Pick a color scheme"; }' -theme ~/.config/rofi/themes/single-wide.rasi)

selected_theme_path=${themes["$selected_theme"]}
wal -f "$selected_theme_path"