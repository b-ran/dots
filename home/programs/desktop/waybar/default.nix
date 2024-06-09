{ pkgs, config, ... }:

with config.lib.stylix.colors.withHashtag;
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

  stylix.targets.waybar.enable = false;

  programs = {
    waybar = {
      enable = true;
      style = ''
        @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
        @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

        @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
        @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};

        * {
         font-family: ${config.stylix.fonts.serif.name};
         font-size: 17px;
         min-height: 0;
        }

        .modules-left, .modules-center, .modules-right {
          background: @base00;
          color: @base05;
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
          background-color: @base00;
        }

        #workspaces button {
         color: @base05;
        }

        #workspaces button.active {
         color:  @base0D;
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
          background-color: @base00;
          padding: 0.5rem 0.75rem;
          border-radius: 1rem;
        }

        #pulseaudio {
         color: @base0E;
        }

        #pulseaudio.muted {
          color: @base0F;
        }

        #cpu {
         color: @base0B;
        }

        #memory {
         color: @base09;
        }

        #network {
          color: @base0A;
        }

        #clock {
          color: @base0C;
        }

        tooltip {
         background: @base00;
         border: 1px solid @base0D;
        }

        tooltip label {
         color: @base05;
        }
      '';
    };
  };
}
