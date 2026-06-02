hl.bind("SUPER + C",            hl.dsp.window.close())
hl.bind("SUPER + F",            hl.dsp.window.fullscreen("fullscreen"))
hl.bind("SUPER + SHIFT + F",    hl.dsp.window.fullscreen("maximized"))
hl.bind("SUPER + T",            hl.dsp.window.float())

hl.bind("SUPER + D",            hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/themes/drun.rasi"))
hl.bind("SUPER + N",            hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind("SUPER + B",            hl.dsp.exec_cmd(" ~/.config/rofi/menus/background-select.sh"))
hl.bind("SUPER + X",            hl.dsp.exec_cmd("~/.config/rofi/menus/power.sh"))
hl.bind("SUPER + SHIFT + S",    hl.dsp.exec_cmd(" ~/.config/rofi/menus/screenshot.sh"))

hl.bind("SUPER + Return",       hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + E",            hl.dsp.exec_cmd("pkill -SIGUSR1 ie-r"))
hl.bind("SUPER + SHIFT + E",    hl.dsp.exec_cmd("pkill -SIGUSR2 ie-r"))

hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

for i = 1, 10 do
  local key = i % 10  -- 10 -> 0
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + TAB",   hl.dsp.workspace.toggle_special("scratch"))
hl.bind("SUPER + minus", hl.dsp.window.move({ workspace = "special:scratch" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })