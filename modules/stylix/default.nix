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
  ];  

  stylix = {
    enable = true;
    base16Scheme = ./themes/tokyo-night.yaml;
    image = ../../wallpapers/aquarium-painting.png;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = {
        package = pkgs.noto-fonts-emoji;
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