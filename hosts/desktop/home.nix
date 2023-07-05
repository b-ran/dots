{ pkgs, ... }:

{
    imports =
      (import ../../modules/programs/cli);

  home = {
    sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = 1;
        BROWSER = "firefox";
    };

    packages = with pkgs; [

    ];
  };

}
