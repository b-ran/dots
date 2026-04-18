# Menu options
shutdown="$(printf '\uf16f')"
reboot="$(printf '\ue5d5')"
suspend="$(printf '\uef44')"
logout="$(printf '\ue9ba')"

# Give options to rofi and save choice
chosen="$(echo -e "$shutdown\n$reboot\n$suspend\n$logout" | rofi -dmenu -config ~/.config/rofi/themes/powermenu.rasi )"

case "$chosen" in
  "$shutdown")
    poweroff
    ;;
  "$reboot")
    reboot
    ;;
  "$suspend")
    systemctl suspend & playerctl pause & hyprlock -f
    ;;
  "$logout")
    loginctl terminate-session $XDG_SESSION_ID
    ;;
  *)
    exit 0
    ;;
esac