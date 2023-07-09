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
{ config, pkgs, lib, ... }:
{


  programs = {
    waybar = {
       enable = true;

       package = pkgs.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
       });

       settings.mainBar = {
           height = 35;
           spacing = 4;
           layer = "top";
           modules-left = ["wlr/workspaces"];
           modules-right = ["pulseaudio" "cpu" "memory" "network" "clock" "tray"];

           clock = {
             format = "{:%H:%M} 󰅐";
             format-alt = "{:%A, %B %d, %Y (%R)} 󰅐";
             tooltip-format = "<tt><small>{calendar}</small></tt>";
             calendar = {
               mode = "month";
#               mode-mon-col = 3;
#               weeks-pos = "right";
#               on-scroll = 1;
#               on-click-right = "mode";
               format = {
                 months = "<span color='#ffead3'><b>{}</b></span>";
                 days = "<span color='#ecc6d9'><b>{}</b></span>";
                 weeks = "<span color='#99ffdd'><b>W{}</b></span>";
                 weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                 today = "<span color='#ff6699'><b><u>{}</u></b></span>";
               };
             };
             actions = {
               on-click-right = "mode";
             };
           };


           network = {
               format-wifi = "{essid}ff ({signalStrength}%) ";
                   format-ethernet = "󰈀";
                   tooltip-format = "{ifname} via {gwaddr}";
                   format-linked = "{ifname} (No IP)";
                   format-disconnected = "Disconnected ⚠";
                   format-alt = "{ifname}: {ipaddr}/{cidr}";
           };
           pulseaudio = {
               format = "{volume}% {icon} {format_source}";
               format-bluetooth = "{volume}% {icon} {format_source}";
               format-bluetooth-muted = "{icon} {format_source}";
               format-muted = "{format_source}";
               format-source = "{volume}% ";
               format-source-muted = "";
               format-icons = {
                   default = ["" "" ""];
               };
               on-click = "pavucontrol";
           };
           tray = {
               spacing = 10;
           };
           cpu = {
               format = "{usage}% 󰘚";
               tooltip = false;
           };
           memory = {
               format = "{}% ";
           };

           "wlr/workspaces" = {
              format =  "{icon}";
              on-click = "activate";

              format-icons = {
                "1" = "";
                "2" = "";
                "3" = "";
                "4" = "󰌃";
                "5" =  "󰭹";
                "6" =  "";
                "7" = "";
                "8" = "";
                "9" = "";
                "urgent" = "";
                "default" = "";
              };

              sort-by-number = true;
           };
       };
       style = ''
           * {
               font-family: JetBrainsMono, sans-serif;
               font-size: 16px;
               color: #cba6f7;
           }

           window#waybar {
               background-color: rgba(43, 48, 59, 0);
               border-bottom: 3px solid rgba(100, 114, 125, 0);
               transition-property: background-color;
               transition-duration: .5s;
           }

           window#waybar.hidden {
               opacity: 0.2;
           }

           button {
               /* Use box-shadow instead of border so the text isn't offset */
               box-shadow: inset 0 -3px transparent;
               /* Avoid rounded borders under each button name */
               border: none;
               border-radius: 0;
           }

           button:hover {
               background: inherit;
               box-shadow: inset 0 -3px #ffffff;
           }

           #workspaces button {
               padding: 5px;
               background-color: transparent;
               color: #cba6f7;
           }

           #workspaces button:hover {
               background: rgba(0, 0, 0, 0.2);
           }

           #workspaces button.active{
               color: #cba6f7;
               border-radius: 10px;
               box-shadow: inset 0 -3px #cba6f7;
           }

           #workspaces button.urgent {
               background-color: #eb4d4b;
           }

           #mode {
               background-color: #64727D;
               border-bottom: 3px solid #ffffff;
           }

           #clock,
           #battery,
           #cpu,
           #memory,
           #disk,
           #temperature,
           #backlight,
           #network,
           #pulseaudio,
           #wireplumber,
           #custom-media,
           #tray,
           #mode,
           #idle_inhibitor,
           #scratchpad,
           #mpd,
           #window,
           #workspaces {
               margin-top: .70rem;
               background: #11111B;
               opacity: .85;
               padding: 0 1rem;
               border-radius: .75rem;
           }
           #battery{
               padding-right: 1.75rem;
           }
           #network{
               padding-right: 1.5rem;
           }
           #memory,
           #cpu{
               padding-right: 1.25rem;
           }
           #tray{
               margin-right: .5rem;
           }
           /* If workspaces is the leftmost module, omit left margin */
           .modules-left > widget:first-child > #workspaces {
               margin-left: .9rem;
           }

           .modules-right{
               margin-right: .70rem;
           }

           /* If workspaces is the rightmost module, omit right margin */
           .modules-right > widget:last-child > #workspaces {
               margin-right: .9rem;
           }

           '';
    };
  };


}