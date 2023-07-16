{ config, pkgs, ... }:

{
  home = {
    file.".config/rofi/themes/colors.rasi".text = ''
      * {
        base:     #1e1e2eff;
        sky:      #89dcebff;
        text:     #cdd6f4ff;
        red:      #f38ba8ff;
        yellow:   #f9e2afff;
      }
    '';

    file.".config/rofi/themes/combi.rasi".text = ''
      configuration {
        show-icons: true;
        display-combi: "";
        combi-display-format: "{text}";
        disable-history: false;
        click-to-exit: true;
        location: 0;
      }

      @import "colors.rasi"

      window {
        transparency: "real";
        background-color: @base;
        text-color: @text;
        border: 2px;
        border-color: @sky;
        border-radius: 10px;
        width: 500px;
        anchor: center;
        x-offset: 0;
        y-offset: 0;
      }

      prompt {
        enabled: true;
        padding: 8px;
        background-color: @base;
        text-color: @yellow;
      }

      textbox-prompt-colon {
        expand: false;
        str: "";
        border-radius: 100%;
        background-color: @base;
        text-color: @text;
        padding: 8px 12px 8px 12px;
      }

      entry {
        background-color: @base;
        text-color: @text;
        placeholder-color: @text;
        expand: true;
        horizontal-align: 0;
        placeholder: "Search...";
        blink: true;
        padding: 8px;
      }

      inputbar {
        children: [ textbox-prompt-colon, prompt, entry ];
        background-color: @base;
        text-color: @text;
        expand: false;
        border: 0px 0px 0px 0px;
        border-radius: 0px;
        border-color: @sky;
        margin: 0px 0px 0px 0px;
        padding: 0px;
        position: center;
      }

      case-indicator {
        background-color: @base;
        text-color: @text;
        spacing: 0;
      }

      listview {
        background-color: @base;
        columns: 1;
        lines: 7;
        spacing: 4px;
        cycle: false;
        dynamic: true;
        layout: vertical;
      }

      mainbox {
        background-color:  @base;
        children: [ inputbar, listview ];
        spacing: 15px;
        padding: 15px;
      }

      element {
        background-color: @base;
        text-color: @text;
        orientation: horizontal;
        border-radius: 4px;
        padding: 6px 6px 6px 6px;
      }

      element-icon {
        background-color: inherit;
        text-color: inherit;
        horizontal-align: 0.5;
        vertical-align: 0.5;
        size: 24px;
        border: 0px;
      }

      element-text {
        background-color: inherit;
        text-color: inherit;
        expand: true;
        horizontal-align: 0;
        vertical-align: 0.5;
        margin: 2px 0px 2px 2px;
      }

      element normal.urgent,
      element alternate.urgent {
        background-color: @red;
        text-color: @text;
        border-radius: 9px;
      }

      element normal.active,
      element alternate.active {
        background-color: @sky;
        text-color: @text;
      }

      element selected {
        background-color: @sky;
        text-color: @base;
        border: 0px 0px 0px 0px;
        border-radius: 10px;
        border-color: @sky;
      }

      element selected.urgent {
        background-color: @red;
        text-color: @text;
      }

      element selected.active {
        background-color: @sky;
        color: @text;
      }
    '';

    file.".config/rofi/menus/powermenu.sh" = {
      executable = true;
      text = ''
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
          loginctl terminate-user "$(whoami)"
        elif [ x"$*" = x"Hibernate" ]; then
          systemctl hibernate
        elif [ x"$*" = x"Lock" ]; then
          swaylock -f && exit
        fi

        get_options
      '';
    };

  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrainsMono Nerd Font 12";
  };
}
