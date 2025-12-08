{ pkgs, config, ... }:

{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    winePackages.fonts
    material-symbols
  ];

  stylix = {
    enable = true;
    base16Scheme = ./themes/tokyo-night.yaml;
    targets = {
      chromium.enable = false;
      qt.enable = true;
      grub.enable = false;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 32; # 24, 32, 48,
    };

  };
}