{ pkgs, config, ... }:

with config.lib.stylix.colors.withHashtag;
{
  programs.hyprpanel = {
    enable = false;
    systemd.enable = true;

    settings = {
      wallpaper.enable = false;
      bar = {
        customModules = {
          cava = {
            showIcon = false;
            showActiveOnly = true;
            leftClick = "menu:media";
          };
        };

        clock.format = "%I:%M";
        clock.icon = "󰅐";
        media.show_active_only = true;
        workspaces = {
          show_icons = false;
          show_numbered = true;
          numbered_active_indicator = "color";
          ignored = "-99"; # Ignore the "floating" workspace
        };

        launcher = {
          autoDetectIcon = true;
        };

        volume = {
          label = true;
        };

        bluetooth = {
          label = true;
        };

        systray = {
          ignore = [
            "chrome_status_icon_1"
            "Xwayland Video Bridge_pipewireToXProxy"
            "blueman"
          ];
        };

        network = {
          showWifiInfo = true;
          label = true;
        };

        battery = {
          hideLabelWhenFull = true;
        };

        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };

        layouts = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [ "cava" ];
            right = [
              "volume"
              "bluetooth"
              "network"
              "clock"
              "notifications"
              "systray"
            ];
          };
          "*" = {
            left = [
              "workspaces"
            ];
            middle = [ ];
            right = [
              "volume"
              "bluetooth"
              "network"
              "clock"
              "systray"
            ];
          };
        };
      };

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather = {
          enabled = false;
          unit = "metric";
        };
      };

      menus.dashboard = {
        stats.enable_gpu = true;
        directories = {
          left = {
            directory3 = {
              label = "󰚝 Workspace";
              command = "xdg-open ~/workspace";
            };
          };
        };
        shortcuts = {
          left = {
            shortcut4 = {
              label = "󰒻 Apps";
              command = "rofi -show drun -theme ~/.config/rofi/themes/dual.rasi";
            };
          };
        };
      };

      theme = {
        bar = {
          font = {
            name = "JetBrainsMono Nerd Font";
            label = "JetBrainsMono Nerd Font";
            size = "1.1rem";
          };
          transparent = true;
          floating = true;
          margin_sides = "0";
          outer_spacing = "0.5rem";
          margin_top = "0.4rem";

          background = base00;
          border.color = base03;
          borderColor = base03;

          buttons = {
            background_opacity = 75;
            radius = "1rem";
            y_margins = "0";
            modules.cava.spacing = "0";

            icon = base09;
            text = base09;
            hover = base01;
            background = base00;
            icon_background = base00;

            media = {
              icon = base0B;
              text = base0B;
              border = base0B;
            };

            dashboard = {
              icon = base00;
              background = base0C;
              border = base0C;
            };

            workspaces = {
              active = base0D;
              occupied = base05;
              available = base0C;
              hover = base0D;
              border = base0D;
            };

            windowtitle = {
              icon = base0C;
              text = base0C;
              border = base0C;
            };

            volume = {
              icon = base0E;
              text = base0E;
              border = base0E;
              output_icon = base04;
              output_text = base0E;
              input_icon = base04;
              input_text = base0E;
              separator = base01;
            };

            network = {
              icon = base0A;
              text = base0A;
              border = base0A;
            };

            bluetooth = {
              icon = base0C;
              text = base0C;
              border = base0C;
            };

            systray = {
              border = base03;
              customIcon = base06;
            };

            battery = {
              icon = base0B;
              text = base0B;
              border = base0B;
            };

            clock = {
              icon = base0D;
              text = base0D;
              border = base0D;
            };

            notifications = {
              total = base08;
              icon = base08;
              border = base08;
            };

            modules = {
              cpu = {
                icon = base09;
                text = base09;
                border = base09;
              };

              cpuTemp = {
                icon = base09;
                text = base09;
                border = base09;
              };

              ram = {
                icon = base0B;
                text = base0B;
                border = base0B;
              };

              storage = {
                icon = base0C;
                text = base0C;
                border = base0C;
              };

              netstat = {
                icon = base0A;
                text = base0A;
                border = base0A;
              };

              weather = {
                icon = base09;
                text = base09;
                border = base09;
              };

              updates = {
                icon = base08;
                text = base08;
                border = base08;
              };

              kbLayout = {
                icon = base0E;
                text = base0E;
                border = base0E;
              };

              power = {
                icon = base0A;
                text = base0A;
                border = base0A;
              };

              submap = {
                icon = base0E;
                text = base0E;
                border = base0E;
              };

              hyprsunset = {
                icon = base0A;
                text = base0A;
                border = base0A;
              };

              hypridle = {
                icon = base0A;
                text = base0A;
                border = base0A;
              };

              cava = {
                icon = base0D;
                text = base0D;
                border = base0D;
              };

              microphone = {
                icon = base0E;
                text = base0E;
                border = base0E;
              };

              worldclock = {
                icon = base0D;
                background = base0D;
                border = base0D;
              };
            };
          };

          menus = {
            background = base00;
            text = base06;
            border.color = base03;
            label = base0E;
            feinttext = base03;
            dimtext = base03;
            cards = base01;

            icons = {
              active = base0E;
              passive = base03;
            };

            listitems = {
              active = base0E;
              passive = base06;
            };

            iconbuttons = {
              active = base0E;
              passive = base06;
            };

            buttons = {
              text = base00;
              disabled = base07;
              active = base08;
              default = base0E;
            };

            switch = {
              puck = base07;
              disabled = base07;
              enabled = base0E;
            };

            progressbar = {
              background = base03;
              foreground = base0E;
            };

            slider = {
              puck = base07;
              backgroundhover = base03;
              background = base07;
              primary = base0E;
            };

            check_radio_button = {
              background = base02;
              active = base0E;
            };

            dropdownmenu = {
              divider = base01;
              text = base06;
              background = base00;
            };


            tooltip = {
              text = base06;
              background = base00;
            };

            popover = {
              text = base0E;
              background = base00;
              border = base00;
            };

            menu = {
              media = {
                border.color = base00;
                background.color = base00;
                card.color = base01;
                song = base0D;
                artist = base0D;
                album = base0D;
                timestamp = base06;

                slider = {
                  puck = base00;
                  backgroundhover = base00;
                  background = base00;
                  primary = base0D;
                };

                buttons = {
                  text = base00;
                  background = base0D;
                  enabled = base0D;
                  inactive = base01;
                };
              };

              # Volume menu
              volume = {
                text = base06;
                card.color = base01;
                label.color = base0E;
                border.color = base00;
                background.color = base00;

                audio_slider = {
                  puck = base03;
                  backgroundhover = base03;
                  background = base07;
                  primary = base0E;
                };

                input_slider = {
                  puck = base03;
                  backgroundhover = base03;
                  background = base07;
                  primary = base0E;
                };

                icons = {
                  active = base0E;
                  passive = base07;
                };

                iconbutton = {
                  active = base0E;
                  passive = base06;
                };

                listitems = {
                  active = base0E;
                  passive = base06;
                };
              };

              # Network menu
              network = {
                text = base06;
                label.color = base0A;
                border.color = base00;
                background.color = base00;
                card.color = base01;
                status.color = base07;

                switch = {
                  enabled = base0A;
                  disabled = base07;
                  puck = base07;
                };

                icons = {
                  active = base0A;
                  passive = base07;
                };

                iconbuttons = {
                  active = base0A;
                  passive = base06;
                };

                listitems = {
                  active = base0A;
                  passive = base06;
                };

                scroller.color = base03;
              };

              bluetooth = {
                text = base06;
                label.color = base0C;
                border.color = base00;
                background.color = base00;
                card.color = base01;
                status = base07;
                switch_divider = base03;

                switch = {
                  puck = base07;
                  disabled = base07;
                  enabled = base0C;
                };

                icons = {
                  active = base0C;
                  passive = base07;
                };

                iconbutton = {
                  active = base0C;
                  passive = base06;
                };

                listitems = {
                  active = base0C;
                  passive = base06;
                };

                scroller.color = base03;
              };

              battery = {
                text = base06;
                label.color = base0A;
                border.color = base00;
                background.color = base00;
                card.color = base01;

                slider = {
                  puck = base07;
                  backgroundhover = base00;
                  background = base00;
                  primary = base0A;
                };

                icons = {
                  active = base0A;
                  passive = base07;
                };

                listitems = {
                  active = base0A;
                  passive = base06;
                };
              };

              clock = {
                text = base06;
                border.color = base00;
                background.color = base00;
                card.color = base01;

                time = {
                  time = base0D;
                  timeperiod = base0D;
                };

                calendar = {
                  yearmonth = base0D;
                  weekdays = base0D;
                  paginator = base0D;
                  currentday = base0D;
                  days = base06;
                  contextdays = base0D;
                };

                weather = {
                  icon = base0D;
                  temperature = base06;
                  status = base0D;
                  stats = base0D;

                  thermometer = {
                    extremelyhot = base08;
                    hot = base09;
                    moderate = base0A;
                    cold = base0C;
                    extremelycold = base0C;
                  };

                  hourly = {
                    time = base0D;
                    icon = base0D;
                    temperature = base0D;
                  };
                };
              };

              # Dashboard menu
              dashboard = {
                border.color = base00;
                background.color = base00;
                card.color = base01;

                profile.name = base06;

                powermenu = {
                  sleep = base0C;
                  logout = base0B;
                  restart = base0A;
                  shutdown = base08;

                  confirmation = {
                    background = base00;
                    card = base01;
                    border = base00;
                    label = base0E;
                    body = base06;
                    button_text = base00;
                    confirm = base0B;
                    deny = base08;
                  };
                };

                shortcuts = {
                  background = base0C;
                  text = base00;
                  recording = base09;
                };

                controls = {
                  disabled = base03;

                  wifi = {
                    background = base0A;
                    text = base00;
                  };

                  bluetooth = {
                    background = base0C;
                    text = base00;
                  };

                  notifications = {
                    background = base08;
                    text = base00;
                  };

                  volume = {
                    background = base0E;
                    text = base00;
                  };

                  input = {
                    background = base0E;
                    text = base00;
                  };
                };

                directories = {
                  left = {
                    top.color = base06;
                    middle.color = base06;
                    bottom.color = base06;
                  };

                  right = {
                    top.color = base06;
                    middle.color = base06;
                    bottom.color = base06;
                  };
                };

                monitors = {
                  bar_background = base03;

                  cpu = {
                    icon = base09;
                    bar = base09;
                    label = base09;
                  };

                  ram = {
                    icon = base0B;
                    bar = base0B;
                    label = base0B;
                  };

                  gpu = {
                    icon = base0F;
                    bar = base0F;
                    label = base0F;
                  };

                  disk = {
                    icon = base0C;
                    bar = base0C;
                    label = base0C;
                  };
                };
              };

              notifications = {
                background = base00;
                card = base00;
                border = base00;
                label = base08;
                no_notifications_label = base08;
                switch_divider = base03;
                clear = base08;

                switch = {
                  puck = base07;
                  disabled = base07;
                  enabled = base08;
                };

                pager = {
                  background = base01;
                  button = base06;
                  label = base06;
                };

                scrollbar.color = base03;
              };

              power = {
                border.color = base00;
                background.color = base00;
                card.color = base01;

                buttons = {
                  shutdown = {
                    icon = base00;
                    background = base01;
                    icon_background = base08;
                    text = base08;
                  };

                  restart = {
                    icon = base00;
                    background = base01;
                    icon_background = base0A;
                    text = base0A;
                  };

                  logout = {
                    icon = base00;
                    background = base01;
                    icon_background = base0B;
                    text = base0B;
                  };

                  sleep = {
                    icon = base00;
                    background = base01;
                    icon_background = base0C;
                    text = base0C;
                  };
                };
              };
            };
          };
        };

        osd = {
          margins = "0px 20px 0px 0px";
          label = base0E;
          icon = base00;
          icon_container = base0E;
          bar_container = base00;
          bar_color = base0E;
          bar_empty_color = base03;
          bar_overflow_color = base08;
          border.color = base00;
        };

        notification = {
          background = base01;
          border = base01;
          label = base06;
          labelicon = base06;
          text = base06;
          time = base06;

          close_button = {
            label = base08;
            background = base01;
          };

          actions = {
            text = base06;
            background = base01;
          };
        };
      };

    };
  };
}
