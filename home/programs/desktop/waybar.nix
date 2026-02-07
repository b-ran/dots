{ pkgs, config, ... }:

with config.lib.stylix.colors.withHashtag;
{
  stylix.targets.waybar.enable = false;
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "group/expand"
            "bluetooth"
            "network"
            "pulseaudio"
            "battery"
          ];
          reload_style_on_change = true;
          layer = "bottom";

          "group/expand" = {
            orientation = "horizontal";
            drawer = {
              transition-duration = 600;
              transition-to-left = true;
              click-to-reveal = true;
            };
            modules = [
              "custom/expand"
              "cpu"
              "memory"
              "temperature"
              "tray"
              "custom/endpoint"
            ];
          };

          clock = {
            format = "{:%H:%M %a, %b %d}";
            interval = 1;
            tooltip-format = "<tt>{calendar}</tt>";
          };

          "hyprland/workspaces" = {
            disable-scroll = true;
            format = "{icon}";
            format-icons = {
              "0" = "0";
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
            };
            on-click = "activate";
            sort-by-number = true;
          };

          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = " ";
            format-bluetooth = "{icon} {volume}%";
            format-bluetooth-muted = " ";
            format-icons = {
              default = [
                " "
                " "
                " "
              ];
            };
            format-source = " {volume}%";
            format-source-muted = "";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-click-right = "pavucontrol";
          };

          "custom/notification" = {
            tooltip = false;
            format = "";
            on-click = "swaync-client -t -sw";
            escape = true;
          };

          network = {
            format-wifi = "";
            format-ethernet = "󰈀";
            format-disconnected = "";
            tooltip-format-disconnected = "Error";
            tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
            tooltip-format-ethernet = "{ifname} 󰈀 ";
            on-click = "nm-connection-editor";
          };

          bluetooth = {
            format-on = "";
            format-off = "󰂲";
            format-disabled = "󰂲";
            format-connected-battery = "󰂯 {device_battery_percentage}% ";
            format-alt = "󰂯 {device_alias}";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
            on-click-right = "blueman-manager";
          };

          battery = {
            interval = 30;
            states = {
              good = 95;
              warning = 30;
              critical = 20;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% 󰂄 ";
            format-alt = "{time} {icon}";
            format-icons = [
              "󰁻"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
            ];
          };

          "custom/expand" = {
            format = "";
            tooltip = false;
          };

          "custom/endpoint" = {
            format = "|";
            tooltip = false;
          };

          cpu = {
            format = "󰻠";
            tooltip = true;
          };

          memory = {
            format = "";
          };

          temperature = {
            critical-threshold = 80;
            format = "";
          };

          tray = {
            icon-size = 14;
            spacing = 10;
          };
        };
      };
      style = ''
        @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
        @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

        @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
        @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};

        * {
          font-size:15px;
          font-family: ${config.stylix.fonts.serif.name};
        }

        window#waybar{
            all: unset;
        }

        .modules-left {
            padding: 7px;
            margin: 3 0 3 3;
            border-radius: 10px;
            background: alpha(@base00,.6);
        }

        .modules-center {
            padding: 7px;
            margin: 3 0 3 0;
            border-radius: 10px;
            background: alpha(@base00,.6);
        }

        .modules-right {
            padding: 7px;
            margin: 3 3 3 0;
            border-radius: 10px;
            background: alpha(@base00,.6);
        }

        tooltip {
            background: @base00;
            color: @base05;
        }

        #workspaces {
            padding: 0px 5px;
        }

        #workspaces button {
            all: unset;
            padding: 0px 5px;
            color: alpha(@base05,.4);
            transition: all .2s ease;
        }

        #workspaces button.active {
            color: @base05;
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
        }

        #workspaces button.empty {
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
        }

        #workspaces button.empty:hover {
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
        }

        #workspaces button.empty.active {
            color: @base05;
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
        }

        #tray,
        #network,
        #clock,
        #battery,
        #bluetooth,
        #pulseaudio,
        #temperature,
        #memory,
        #cpu,
        #custom-expand,
        #group-expand,
        #custom-endpoint,
        workspaces {
          color: @base05;
          background-color: transparent;
          padding: 0px 5px;
          transition: all .3s ease; 
        }

        #pulseaudio {
          padding-left: 10px;
        }

        #network {
          margin-right: 5px;
        }

        #battery.critical:not(.charging) {
            color: @base08;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #custom-expand:hover {
            color: rgba(255,255,255,.2);
        }
      '';
    };
  };
}
