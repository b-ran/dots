{ pkgs, ... }:

{
  imports =
    (import ../../home) ++
    (import ../../home/services) ++
    (import ../../home/programs/apps) ++
    (import ../../home/programs/desktop) ++
    (import ../../home/programs/cli);

    programs = {
      home-manager.enable = true;
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
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
}
