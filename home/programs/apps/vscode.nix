{ pkgs, ... }:

{
  stylix.targets.waybar.enable = false;
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {

      "window.title" = "\${activeEditorShort}";
      "window.titleBarStyle" = "native";
      "window.zoomLevel" = 2;
      "window.menuBarVisibility" = "toggle";
      "window.commandCenter" = false;

      "editor.fontSize" = 12;
      "editor.tabSize" = 1.5;
      "editor.wordWrap" = "on";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = false;
      "editor.formatOnPaste" = false;
      "editor.minimap.enabled" = false;
      "editor.scrollbar.horizontalScrollbarSize" = 4;
      "editor.scrollbar.verticalScrollbarSize" = 4;
      
      "explorer.compactFolders" = false;
      "explorer.autoReveal"= false;
      "breadcrumbs.enabled"= true;

      "workbench.tips.enabled" = true;
      "workbench.statusBar.visible" = true;
      "workbench.layoutControl.enabled" = false;
      "workbench.editor.enablePreview" = false;
      "workbench.editor.empty.hint" = "hidden";
      "workbench.activityBar.location" = "hidden";
      "workbench.startupEditor" = "none";
      "workbench.editor.labelFormat" = "short";

      # Linked editing
      "editor.linkedEditing" = true;

      # Telemetry
      "telemetry.telemetryLevel" = "off";

      # Plugins
      "svelte.enable-ts-plugin" = true;

      # Files
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;


      # File Types
      "[nix]"."editor.tabSize" = 2;

      # Search
      "search.exclude" = {
        "**/node_modules" = true;
        "**/bower_components" = true;
        "**/*.code-search" = true;
        "**/.svelte-kit" =  true;
      };

      # GitLens
      "gitlens.codeLens.enabled" = false;
      "gitlens.currentLine.enabled" = false;
      "gitlens.statusBar.enabled" = false;

      # Tokyo Night JDoc
      "editor.tokenColorCustomizations" = {
        "[Tokyo Night]" = {
          "textMateRules" = [
            {
              "scope" = [
                "comment keyword.codetag.notation"
                "comment.block.documentation keyword"
                "comment.block.documentation storage.type.class"
              ];
              "settings" = {
                "foreground" = "#bb9af7";
              };
            }
            {
              "scope" = ["comment.block.documentation entity.name.type.instance"];
              "settings" = {
                "foreground" = "#73daca";
                "fontStyle" = "italic";
              };
            }
            {
              "scope" = [
                "comment.block.documentation entity.name.type punctuation.definition.bracket"
              ];
              "settings" = {
                "foreground" = "#bb9af7";
              };
            }
            {
              "workbench.colorTheme" = "Tokyo Night";
              "scope" = ["comment.block.documentation variable"];
              "settings" = {
                "foreground" = "#e0af68";
                "fontStyle" = "italic";
              };
            }
          ];
        };
      };
    };
     extensions = with pkgs.open-vsx; [
      # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/open-vsx-latest.json

      # Essentials
      editorconfig.editorconfig
      streetsidesoftware.code-spell-checker
      mikestead.dotenv

      # Scripts
      skellock.just

      # Interface
      eamodio.gitlens
      christian-kohler.path-intellisense
      usernamehw.errorlens
      formulahendry.code-runner
      enkia.tokyo-night

      # Markdown
      yzhang.markdown-all-in-one

      # Yaml
      redhat.vscode-yaml

      # Containers
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-azuretools.vscode-docker

      # Python
      batisteo.vscode-django

      # Web
      rangav.vscode-thunder-client
      yoavbls.pretty-ts-errors
      svelte.svelte-vscode
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      bradlc.vscode-tailwindcss
      pflannery.vscode-versionlens
      csstools.postcss

      # Testing
      vitest.explorer
      ms-playwright.playwright
      firefox-devtools.vscode-firefox-debug
      ms-vscode.test-adapter-converter

      # Nix
      jnoortheen.nix-ide
    ]
    ++ (with pkgs.vscode-marketplace; [
      # https://raw.githubusercontent.com/nix-community/nix-vscode-extensions/master/data/cache/vscode-marketplace-latest.json
      # Interface
      amodio.toggle-excluded-files

      # Remote
      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode.remote-explorer
      ms-vscode.live-server
      ms-vsliveshare.vsliveshare

      # Python
      ms-python.vscode-pylance
      ms-python.python

      # Git
      github.vscode-pull-request-github

      # AI
      github.copilot

      # Web
      wallabyjs.quokka-vscode
      ardenivanov.svelte-intellisense
    ]);
  };
}
