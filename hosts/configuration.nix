{ pkgs, user, ... }:

{
  system.stateVersion = "23.11";
  time.timeZone = "Pacific/Auckland";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
    shell = pkgs.zsh;
  };

  fonts.fonts = with pkgs; [
    carlito
    vegur
    source-code-pro
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      networkmanagerapplet
      networkmanager-openvpn
    ];
  };

  security.pam.services.swaylock = { };
  security.pam.services.swaylock.text = ''
    auth include login
  '';
  security.polkit.enable = true;
  services.udisks2.enable = true;

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
