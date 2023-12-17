{ lib, pkgs, user, ... }:

{
#      imports =
#        [( import ../home/programs/cli/bat.nix )] ++
#        [( import ../home/programs/cli/btop.nix )] ++
#        [( import ../home/programs/cli/exa.nix )] ++
#        [( import ../home/programs/cli/fzf.nix )] ++
#        [( import ../home/programs/cli/git.nix )] ++
#        [( import ../home/programs/cli/htop.nix )] ++
#        [( import ../home/programs/cli/lazygit.nix )] ++
#        [( import ../home/programs/cli/ripgrep.nix )] ++
#        [( import ../home/programs/cli/starship.nix )] ++
#        [( import ../home/programs/cli/tmux.nix )] ++
#        [( import ../home/programs/cli/zsh.nix )] ++
#        [( import ../home/programs/apps/alacritty.nix )];

    imports =
      (import ../home/programs/cli);

    programs = {
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
        alacritty
      ];
    };
}