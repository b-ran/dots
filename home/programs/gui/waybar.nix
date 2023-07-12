#{
#  programs.waybar = {
#    enable = true;
#    systemd.enable = true;
##    style = ''
##    @define-color base   #1e1e2e;
##    @define-color mantle #181825;
##    @define-color crust  #11111b;
##
##    @define-color text     #cdd6f4;
##    @define-color subtext0 #a6adc8;
##    @define-color subtext1 #bac2de;
##
##    @define-color surface0 #313244;
##    @define-color surface1 #45475a;
##    @define-color surface2 #585b70;
##
##    @define-color overlay0 #6c7086;
##    @define-color overlay1 #7f849c;
##    @define-color overlay2 #9399b2;
##
##    @define-color blue      #89b4fa;
##    @define-color lavender  #b4befe;
##    @define-color sapphire  #74c7ec;
##    @define-color sky       #89dceb;
##    @define-color teal      #94e2d5;
##    @define-color green     #a6e3a1;
##    @define-color yellow    #f9e2af;
##    @define-color peach     #fab387;
##    @define-color maroon    #eba0ac;
##    @define-color red       #f38ba8;
##    @define-color mauve     #cba6f7;
##    @define-color pink      #f5c2e7;
##    @define-color flamingo  #f2cdcd;
##    @define-color rosewater #f5e0dc;
##    '';
#
#    settings = {
#      mainBar = {
#        layer = "top";
#        position = "top";
#        height = 20;
#        modules-left = [ "wlr/workspaces" ];
#        modules-right = [ "pulseaudio" "cpu" "clock" "tray" ];
#
#        "wlr/workspaces" = {
#          format =  "{icon}";
#          on-scroll-up = "hyprctl dispatch workspace e+1";
#          on-scroll-down = "hyprctl dispatch workspace e-1";
#          on-click = "activate";
#        };
#
#      };
#    };
#  };
#}
{ config, pkgs, lib, hyprland, ... }:
{


  programs = {
    waybar = {
      enable = true;
      package = hyprland.packages.${pkgs.system}.waybar-hyprland;

      settings.mainBar = {
        layer = "top";
        modules-left = [ "wlr/workspaces" ];
        modules-right = [ "pulseaudio" "cpu" "memory" "network" "clock" "tray" ];

        "wlr/workspaces" = {
          disable-scroll = true;
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "󰌃";
            "5" = "󰭹";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "default" = "";
          };
        };

        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = "{icon} {format_source}";
          format-muted = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        cpu = {
          format = "󰘚 {usage}%";
          tooltip = true;
        };

        memory = {
          format = " {}%";
          tooltip = true;
        };

        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        clock = {
          format = "󰅐 {:%H:%M}";
          format-alt = "󰅐 {:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#f38ba8'><b>{}</b></span>";
              weekdays = "<span color='#f2cdcd'><b>{}</b></span>";
              weeks = "<span color='#f9e2af'><b>W{}</b></span>";
              days = "<span color='#74c7ec'><b>{}</b></span>";
              today = "<span color='#a6e3a1'><b>{}</b></span>";
            };
          };
        };

        tray = {
          spacing = 10;
        };

      };
      style = ''

        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        * {
         font-family: JetBrainsMono Nerd Font, sans-serif;
         font-size: 17px;
         min-height: 0;
        }

        #waybar {
         background: transparent;
         color: @text;
         margin: 5px 5px;
        }

        #workspaces {
          border-radius: 1rem;
          margin: 5px;
          background-color: @surface0;
          margin-left: 1rem;
        }

        #workspaces button {
         color: @lavender;
         border-radius: 1rem;
         padding: 0 5px;
         margin: 0 5px;
        }

        #workspaces button.active {
         color: @sky;
         border-radius: 1rem;
        }

        #workspaces button:hover {
         color: @sapphire;
         border-radius: 1rem;
        }

        #tray,
        #network,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #memory,
        #cpu {
          background-color: @surface0;
          padding: 0.5rem 1rem;
          margin: 5px 0
        }

        #clock {
          color: @lavender;
          border-radius: 0 1rem 1rem 0;
          margin-right: 1rem;
        }

        #network {
          color: @flamingo;
        }

        #pulseaudio {
         color: @pink;
         border-radius: 1rem 0 0 1rem;
         margin-left: 1rem;
        }

        #pulseaudio.muted {
          color: @red;
        }

        #cpu {
         color: @green;
        }

        #memory {
         color: @yellow;
        }

        #custom-power {
         border-radius: 1rem;
         color: @red;
         margin-bottom: 1rem;
        }

        #tray {
          margin-right: 1rem;
          border-radius: 1rem;
        }

        tooltip {
         background: @surface0;
         border: 1px solid @pink;
        }

        tooltip label {
         color: @text;
        }

        '';
    };
  };


}
