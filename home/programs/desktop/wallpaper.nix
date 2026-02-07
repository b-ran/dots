{ config, pkgs,  ... }:

{
  home = {
    packages = with pkgs; [
      swww
    ];

    file."wallpapers" = {
      source = ../../../wallpapers;
      # Default lock screen wallpaper
      onChange = ''
        if [ ! -f ~/.config/lock-wallpaper ]; then
           cp ~/wallpapers/astronaut-moonlight-serenity.png ~/.config/lock-wallpaper
        fi
      '';
    };

    file.".config/lock-wallpaper".source = ../../../wallpapers/utility-lake.png;
  };
}