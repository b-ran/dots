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
            "clock"
            "pulseaudio"
          ];
          modules-center = [
            "hyprland/workspaces"
          ];
          modules-right = [
            "tray"
          ];
          reload_style_on_change = true;
          layer = "bottom";
          clock = {
            actions = {
              on-click-right = "mode";
            };
            format = "󰅐 {:%I:%M}";
            format-alt = "󰅐 {:%A, %B %d, %Y (%R)}";
            tooltip = false;
            tooltip-format = "<tt><small>{calendar}</small></tt>";
          };

          cpu = {
            format = "󰘚 {usage}%";
            tooltip = true;
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
              default = "";
              urgent = "";
            };
            on-click = "activate";
            sort-by-number = true;
          };

          memory = {
            format = " {}%";
            tooltip = true;
          };

          network = {
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            format-disconnected = "⚠";
            format-ethernet = "󰈀";
            format-linked = "{ifname} (No IP)";
            format-wifi = "  {signalStrength}%";
            on-click-right = "nm-connection-editor";
            tooltip-format = "{ifname} via {gwaddr}";
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
            on-click = "pavucontrol";
          };

          tray = {
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
         font-family: ${config.stylix.fonts.serif.name};
         font-size: 17px;
         min-height: 0;
        }

        .modules-left, .modules-center, .modules-right {
          background: transparent;
          color: @base05;
          border-radius: 1rem;
          margin: 1px 0 0 1px;
        }

        .modules-right {
          margin-right: 10px;
        }

        #waybar {
         background: transparent;
        }

        #workspaces {
          background-color: transparent;
        }

        #workspaces button {
         color: @base05;
        }

        #workspaces button.active {
         color:  @base0D;
        }

        #workspaces button:hover {
         background: transparent;
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
          background-color: transparent;
          padding: 0.5rem 0.75rem;
        }

        #pulseaudio {
         color: @base05;
        }

        #pulseaudio.muted {
          color: @base05;
        }

        #cpu {
         color: @base05;
        }

        #memory {
         color: @base05;
        }

        #network {
          color: @base05;
        }

        #clock {
          color: @base05;
        }

        tooltip {
         background: @base00;
         border: 0px solid @base0D;
        }

        tooltip label {
         color: @base05;
        }
      '';
    };
  };
}
