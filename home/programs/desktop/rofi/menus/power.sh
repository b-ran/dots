get_options() {
  echo -en "Shutdown\0icon\x1fsystem-shutdown\n"
  echo -en "Reboot\0icon\x1fsystem-reboot\n"
  echo -en "Suspend\0icon\x1fsystem-suspend\n"
  echo -en "Logout\0icon\x1fsystem-log-out\n"
  echo -en "Hibernate\0icon\x1fsystem-hibernate\n"
  echo -en "Lock\0icon\x1fsystem-lock-screen\n"
}

if [ x"$*" = x"Shutdown" ]; then
  systemctl poweroff
elif [ x"$*" = x"Reboot" ]; then
  systemctl reboot
elif [ x"$*" = x"Suspend" ]; then
  systemctl suspend
elif [ x"$*" = x"Logout" ]; then
  loginctl terminate-session $XDG_SESSION_ID
elif [ x"$*" = x"Hibernate" ]; then
  systemctl hibernate
elif [ x"$*" = x"Lock" ]; then
  swaylock -f && exit
else
  option=$(get_options | rofi -dmenu -i -theme ~/.config/rofi/themes/single-wide.rasi -theme-str "listview {lines: 6;}" \ -theme-str 'entry { placeholder: " Search"; }')
  if [ -z "$option" ]; then
    exit 0
  fi
  $0 "$option"
fi
