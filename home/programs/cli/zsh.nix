{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    shellAliases = {
      reload = "source ~/.zshrc";
      lg = "lazygit";
      neo = "neofetch";

      # Unix
      cat = "bat";
      ls = "exa -l --icons";
      watch = "viddy";

      # Git
      gp = "git push";
      gpl = "git pull";
      gc = "git commit -m";
      gco = "git checkout";

      # Kubernetes
      k = "kubectl";
      kp = "kubectl get pods";
      kc = "kubectx";
      kn = "kubens";

      # Docker
      dstop = "docker stop $(docker ps -a -q) 2>/dev/null";

    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "catppuccin-zsh-syntax-hightlighting";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
          sha256 = "Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
        };
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "v2.5.1";
          sha256 = "kaintLXSfLH7zdLtcoZfVNobCJCap0S/Ldq85wd3krI=";
        };
      }
    ];
  };
}
