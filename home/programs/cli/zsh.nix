{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dwt1-shell-color-scripts
    krabby
    woof
    nano
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
      share = true;
      expireDuplicatesFirst = true;
    };

    initContent = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      rand=$(($RANDOM % 2))

      if [ $rand -eq 0 ]
      then
        krabby random
      else
        colorscript random
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "ssh-agent"
        "safe-paste"
        "extract"
        "copyfile"
        "copybuffer"
        "copypath"
      ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent quiet yes
        zstyle :omz:plugins:ssh-agent lazy yes
        zstyle :omz:plugins:ssh-agent agent-forwarding yes
        zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'els --color $realpath'
      '';
    };

    shellAliases = {
      reload = "source ~/.zshrc";
      lg = "lazygit";
      neo = "neofetch";
      chrome = "${pkgs.google-chrome}/bin/google-chrome-stable";

      # Git
      g = "git";
      ga = "git add";
      gp = "git push";
      gpl = "git pull";
      gc = "git commit -m";
      gco = "git checkout";
      gd = "git diff";
      gs = "git status";
      gu = "git reset HEAD~";
      gce = "git config user.email";
      gcn = "git config user.name";


      # Unix
      b = "bat";
      watch = "viddy";
      share = "woof";
      wt = "hyprctl clients";
      copyfile="wl-copy <";
      cava = "cava -p ~/.cache/wal/colors-cava";
      c = "claude";

      dsize = "du -hs";
      l = "eza --icons  -a --group-directories-first -1";
      ll = "eza --icons  -a --group-directories-first -1 --long";
      tree = "eza --icons --tree --group-directories-first";
      findw = "grep -rl";

      # Kubernetes
      k = "kubectl";
      kp = "kubectl get pods";
      kc = "kubectx";
      kn = "kubens";
      ksecret="f() { kubectl get secret -o name | fzf --prompt='Select secret: ' | xargs -r kubectl get -o json | jq -r '.data | to_entries[] | \"\(.key): \(.value | @base64d)\"'; }; f";

      # Python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # Docker
      dstop = "docker stop $(docker ps -a -q) 2>/dev/null";

    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];
  };
}
