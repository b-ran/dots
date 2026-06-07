{
  inputs,
  pkgs,
  config,
  home-manager,
  user,
  ...
}:
let
  wl-record     = (pkgs.callPackage ../../../pkgs/wl-record { });
  wl-screenshot = (pkgs.callPackage ../../../pkgs/wl-screenshot { });
  wl-ocr        = (pkgs.callPackage ../../../pkgs/wl-ocr { });
in
{

  programs = {
    xwayland.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  home-manager.users.${user} = { config, ... }: {
    xdg.configFile = {
      "uwsm/env".source =
        "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
    } // builtins.listToAttrs (map (f: {
      name = "hypr/${f}";
      value.source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/workspace/dots/hosts/modules/hyprland/lua/${f}";
    }) [
      "hyprland.lua"
      "autostart.lua"
      "binds.lua"
      "env.lua"
      "gestures.lua"
      "variables.lua"
      "window.lua"
    ]);

    home.packages = with pkgs; [
      inputs.ie-r.packages.${pkgs.stdenv.hostPlatform.system}.default
      hyprcursor
      wl-clip-persist
      wl-record
      wl-screenshot
      wl-ocr
    ];

    wayland.windowManager.hyprland = {
      enable = false;
      package = null;
      portalPackage = null;
      systemd.enable = true;
    };
  };
}
