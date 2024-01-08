{ pkgs, ... }:

{
  programs.vscode = {
    userSettings = {
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "window.zoomLevel" = 1.5;
    };
    extensions = [
      pkgs.vscode-extensions.svelte.svelte-vscode
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.dbaeumer.vscode-eslint
      pkgs.vscode-extensions.bradlc.vscode-tailwindcss
      pkgs.vscode-extensions.formulahendry.auto-rename-tag
      pkgs.vscode-extensions.formulahendry.auto-close-tag
      pkgs.vscode-extensions.github.copilot
      pkgs.vscode-extensions.editorconfig.editorconfig
      pkgs.vscode-extensions.streetsidesoftware.code-spell-checker
      pkgs.vscode-extensions.ms-azuretools.vscode-docker
      pkgs.vscode-extensions.firefox-devtools.vscode-firefox-debug
      pkgs.vscode-extensions.yzhang.markdown-all-in-one
      pkgs.vscode-extensions.redhat.vscode-yaml
      pkgs.vscode-extensions.eamodio.gitlens
      pkgs.vscode-extensions.christian-kohler.path-intellisense
      pkgs.vscode-extensions.skellock.just
      pkgs.vscode-extensions.formulahendry.code-runner
      pkgs.vscode-extensions.ms-python.python
      pkgs.vscode-extensions.ms-python.vscode-pylance
      pkgs.vscode-extensions.batisteo.vscode-django
    ];
  };
}
