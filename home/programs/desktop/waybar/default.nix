{ config, pkgs, lib, ... }:
{

  home = {
    file.".config/waybar/layouts".source = ./layouts;

    file.".config/waybar/config" = {
      text = ''
        [
          {
            "include": "~/.config/waybar/current-layout",
            "reload_style_on_change": true,
            "layer": "top",
            "clock": {
              "actions": {
                "on-click-right": "mode"
              },
              "format": "󰅐 {:%H:%M}",
              "format-alt": "󰅐 {:%A, %B %d, %Y (%R)}",
              "tooltip-format": "<tt><small>{calendar}</small></tt>"
            },
            "cpu": {
              "format": "󰘚 {usage}%",
              "tooltip": true
            },
            "hyprland/workspaces": {
              "disable-scroll": true,
              "format": "{icon}",
              "format-icons": {
                "0": "0",
                "1": "1",
                "2": "2",
                "3": "3",
                "4": "4",
                "5": "5",
                "6": "6",
                "7": "7",
                "8": "8",
                "9": "9",
                "default": "",
                "urgent": ""
              },
              "on-click": "activate",
              "sort-by-number": true
            },
            "memory": {
              "format": " {}%",
              "tooltip": true
            },
            "network": {
              "format-alt": "{ifname}: {ipaddr}/{cidr}",
              "format-disconnected": "⚠",
              "format-ethernet": "󰈀",
              "format-linked": "{ifname} (No IP)",
              "format-wifi": "  {signalStrength}%",
              "on-click-right": "nm-connection-editor",
              "tooltip-format": "{ifname} via {gwaddr}"
            },
            "pulseaudio": {
              "format": "{icon} {volume}% {format_source}",
              "format-bluetooth": "{icon} {volume}% {format_source}",
              "format-bluetooth-muted": "{icon} {format_source}",
              "format-icons": {
                "default": [
                  "",
                  "",
                  ""
                ]
              },
              "format-muted": "{format_source}",
              "format-source": " {volume}%",
              "format-source-muted": "",
              "on-click": "pavucontrol"
            },
            "tray": {
              "spacing": 10
            }
          }
        ]
      '';
      onChange = ''
         if [ ! -f ~/.config/waybar/current-layout ]; then
            cp ~/.config/waybar/layouts/\[TOP\]\ Default ~/.config/waybar/current-layout
            chmod 600 ~/.config/waybar/current-layout
         fi
         ${pkgs.procps}/bin/pkill -u $USER waybar || true; nohup waybar &>/dev/null &
      '';
    };
  };

  programs = {
    waybar = {
      enable = true;
      style = ''
        @import '../../.cache/wal/colors-waybar.css';

        * {
         font-family: JetBrainsMono Nerd Font, sans-serif;
         font-size: 17px;
         min-height: 0;
        }

        .modules-left, .modules-center, .modules-right {
          background: @background;
          color: @foreground;
          border-radius: 1rem;
          margin: 5px 0 0 5px;
        }

        .modules-right {
          margin-right: 10px;
        }

        #waybar {
         background: transparent;
        }

        #workspaces {
          border-radius: 1rem;
          background-color: @background;
        }

        #workspaces button {
         color: @color14;
        }

        #workspaces button.active {
         color: @color14;
        }

        #workspaces button:hover {
         background: rgba(0, 0, 0, 0.3);
         border-color: rgba(0, 0, 0, 0.3);
         box-shadow: none;
        }

        #tray,
        #network,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #memory,
        #cpu {
          background-color: @background;
          padding: 0.5rem 0.75rem;
          border-radius: 1rem;
        }

        #pulseaudio {
         color: @color13;
        }

        #pulseaudio.muted {
          color: @color1;
        }

        #cpu {
         color: @color10;
        }

        #memory {
         color: @color11;
        }

        #network {
          color: @color3;
        }

        #clock {
          color: @color14;
        }

        tooltip {
         background: @color0;
         border: 1px solid @color13;
        }

        tooltip label {
         color: @foreground;
        }
      '';
    };
  };
}
