{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
    };

    profiles.dev = {
      userSettings = {
        "window.title" = "\${activeEditorShort}";
        "window.zoomLevel" = 1;
        "window.menuBarVisibility" = "toggle";
        "window.commandCenter" = false;

        "editor.fontSize" = 14;
        "editor.tabSize" = 1.5;
        "debug.console.fontSize" = 12;
        "editor.wordWrap" = "on";
        "editor.fontLigatures" = false;
        "editor.formatOnSave" = false;
        "editor.formatOnPaste" = false;
        "editor.mouseWheelZoom" = true;
        "editor.minimap.enabled" = false;
        "editor.scrollbar.horizontalScrollbarSize" = 8;
        "editor.scrollbar.verticalScrollbarSize" = 8;

        "explorer.compactFolders" = false;
        "explorer.autoReveal"= false;
        "breadcrumbs.enabled"= true;

        "workbench.tips.enabled" = true;
        "workbench.statusBar.visible" = false;
        "workbench.layoutControl.enabled" = false;
        "workbench.editor.enablePreview" = false;
        "workbench.editor.empty.hint" = "hidden";
        "workbench.activityBar.location" = "default";
        "workbench.startupEditor" = "none";
        "workbench.editor.labelFormat" = "short";
        "workbench.editor.editorActionsLocation" = "default";

        # Linked editing
        "editor.linkedEditing" = true;

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

        # Tokyo Night JDoc
        "workbench.colorTheme" = "Tokyo Night";
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
      christian-kohler.path-intellisense
      formulahendry.code-runner

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
      yoavbls.pretty-ts-errors
      svelte.svelte-vscode
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      bradlc.vscode-tailwindcss
      pflannery.vscode-versionlens

      # Testing
      vitest.explorer
      ms-playwright.playwright
      firefox-devtools.vscode-firefox-debug
      ms-vscode.test-adapter-converter

      # Syntax
      jnoortheen.nix-ide
      tamasfe.even-better-toml
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

        # AI
        github.copilot

        # Web
        wallabyjs.quokka-vscode
        ardenivanov.svelte-intellisense
      ]);
    };

  };
}