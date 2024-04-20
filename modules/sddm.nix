{ pkgs, user, ... }:

{
  environment.systemPackages = [
    (pkgs.sddm-chili-theme.override {
      themeConfig = {
        background = "/etc/current-wallpaper";
        backgroundMode = "none";
        blur = true;
        recursiveBlurLoops = 5;
        recursiveBlurRadius = 15;
      };
    })
  ];
  
  services.xserver.enable = true;

  services.displayManager = {
    enable = true;
    sessionPackages = [ pkgs.hyprland ];
    sddm = {
      enable = true;
      theme = "chili";
    };
  };
}
