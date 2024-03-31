hyprctl clients | awk '/title: ./ { gsub("\t*title: *", ""); print}' | \
rofi -dmenu -theme ~/.config/rofi/themes/single.rasi | \
xargs -I{} hyprctl dispatch focuswindow "title:{}"