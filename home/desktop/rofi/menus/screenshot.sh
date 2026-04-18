# Credit: https://github.com/hyprwm/contrib/blob/main/grimblast/screenshot.sh
## Add this to the ~/.config/user-dirs.dirs to save in the Screenshots folder: XDG_SCREENSHOTS_DIR="$HOME/Screenshots"

# Options
option_1="󰹑 Capture"
option_2="󰁫 Timer capture"

option_capture_1="󰩬 Capture Area"
option_capture_2="󰍹 Capture Active Screen"
option_capture_3="󰍺 Capture Screen"

option_time_1="5s"
option_time_2="10s"
option_time_3="20s"
option_time_4="30s"
option_time_5="60s"

copy=' Copy'
save=' Save'
copy_save='󰽄 Save & Copy'
edit=' Edit Screenshot'

# Rofi CMD
rofi_cmd() {
  rofi \
    -theme ~/.config/rofi/themes/single.rasi \
    -theme-str "listview {lines: 5;}" \
    -dmenu
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2" | rofi_cmd
}

# Ask for confirmation
timer_exit() {
  echo -e "$option_time_1\n$option_time_2\n$option_time_3\n$option_time_4\n$option_time_5" | rofi_cmd
}

# Confirm and execute
timer_run() {
  selected_timer="$(timer_exit)"
  if [[ "$selected_timer" == "$option_time_1" ]]; then
    countdown=5
    ${1}
  elif [[ "$selected_timer" == "$option_time_2" ]]; then
    countdown=10
    ${1}
  elif [[ "$selected_timer" == "$option_time_3" ]]; then
    countdown=20
    ${1}
  elif [[ "$selected_timer" == "$option_time_4" ]]; then
    countdown=30
    ${1}
  elif [[ "$selected_timer" == "$option_time_5" ]]; then
    countdown=60
    ${1}
  fi
}


# Ask for confirmation
type_screenshot_exit() {
  echo -e "$option_capture_1\n$option_capture_2\n$option_capture_3" | rofi_cmd
}

# Confirm and execute
type_screenshot_run() {
  selected_type_screenshot="$(type_screenshot_exit)"
  if [[ "$selected_type_screenshot" == "$option_capture_1" ]]; then
    option_type_screenshot=area
    ${1}
  elif [[ "$selected_type_screenshot" == "$option_capture_2" ]]; then
    option_type_screenshot=output
    ${1}
  elif [[ "$selected_type_screenshot" == "$option_capture_3" ]]; then
    option_type_screenshot=screen
    ${1}
  fi
}

# Ask for confirmation
copy_save_editor_exit() {
  echo -e "$copy\n$save\n$copy_save\n$edit" | rofi_cmd
}

# Confirm and execute
copy_save_editor_run() {
  selected_chosen="$(copy_save_editor_exit)"
  if [[ "$selected_chosen" == "$copy" ]]; then
    option_chosen=copy
    ${1}
  elif [[ "$selected_chosen" == "$save" ]]; then
    option_chosen=save
    ${1}
  elif [[ "$selected_chosen" == "$copy_save" ]]; then
    option_chosen=copysave
    ${1}
  elif [[ "$selected_chosen" == "$edit" ]]; then
    option_chosen=edit
    ${1}
  fi
}
###

timer() {
  if [[ $countdown -gt 10 ]]; then
    notify-send -t 1000 "Taking Screenshot in ${countdown} seconds"
    countdown_less_10=$((countdown - 10))
    sleep $countdown_less_10
    countdown=10
  fi
  while [[ $countdown -ne 0 ]]; do
    notify-send -t 1000 "Taking Screenshot in ${countdown}"
    countdown=$((countdown - 1))
    sleep 1
  done
}

# take shots
takescreenshot() {
  grimblast --notify "$option_chosen" "$option_type_screenshot"
}

takescreenshot_timer() {
  timer
  grimblast --notify "$option_chosen" "$option_type_screenshot"
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    type_screenshot_run
    copy_save_editor_run "takescreenshot"
  elif [[ "$1" == '--opt2' ]]; then
    timer_run
    type_screenshot_run
    copy_save_editor_run "takescreenshot_timer"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd --opt1
  ;;
$option_2)
  run_cmd --opt2
  ;;
esac