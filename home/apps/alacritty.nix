{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "None";
        dimensions = {
          columns = 82;
          lines = 25;
        };
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_padding = false;
        dynamic_title = true;
      };

      font = {
        size = 12;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };
    };
  };
}
