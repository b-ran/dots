# Background Path
backgroundDir="$HOME/wallpapers"
themesDir="~/.config/rofi/themes"

# Transition config
TYPE="simple"
DURATION=3
SWWW_PARAMS="--transition-type ${TYPE}"

# Retrieve image files as a list
PICS=($(find -L "${backgroundDir}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \)))

# Rofi command
rofiCommand="rofi -show -dmenu -theme ${themesDir}/select.rasi"


executeCommand() {
  cp -f "$1" ~/.config/current-wallpaper
  swww img "$1" ${SWWW_PARAMS}
}

# Show the images
menu() {
  for i in "${!PICS[@]}"; do
    printf "$(basename "${PICS[$i]}" | cut -d. -f1)\x00icon\x1f${PICS[$i]}\n"
  done
}

# Execution
main() {
  choice=$(menu | ${rofiCommand})

  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Find the selected file
  for file in "${PICS[@]}"; do
  # Getting the file
    if [[ "$(basename "$file" | cut -d. -f1)" = "$choice" ]]; then
      selectedFile="$file"
      break
    fi
  done

  # Check the file and execute
  if [[ -n "$selectedFile" ]]; then
    executeCommand "${selectedFile}"
    return 0
  else
    echo "Image not found."
    exit 1
  fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main