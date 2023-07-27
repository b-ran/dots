{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      fd
    ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
    colors = {
      bg = "#1e1e2e";
      "bg+" = "#313244";
      spinner = "#f5e0dc";
      hl = "#f38ba8";
      fg = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      "fg+" = "#cdd6f4";
      prompt = "#cba6f7";
      "hl+" = "#f38ba8";
    };
    defaultOptions = [
      "--height 75% --multi --reverse --margin=0,1"
      "--bind ctrl-f:page-down,ctrl-b:page-up,ctrl-/:toggle-preview"
      "--bind pgdn:preview-page-down,pgup:preview-page-up"
      "--marker='✚' --pointer='▶' --prompt='❯'"
      "--no-separator --scrollbar='█'"
    ];
    fileWidgetCommand = "rg --files --hidden --follow --glob '!.git/*'";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=header,grid --line-range :100 {}'"
    ];
  };

}
