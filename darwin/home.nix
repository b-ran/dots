{ lib, pkgs, user, ... }:

{
    imports =
      (import ../home/programs/apps) ++
      (import ../home/programs/cli);

    programs = {
      alacritty.enable = true;
      mpv.enable = true;

      home-manager.enable = true;
      bat.enable = true;
      btop.enable = true;
      cava.enable = false;
      eza.enable = true;
      fzf.enable = true;
      git.enable = true;
      htop.enable = true;
      k9s.enable = true;
      lazygit.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };

    home = {
      username = "${user}";
      homeDirectory = "/Users/${user}";
      stateVersion = "23.11";

      packages = with pkgs; [

      ];
    };
}