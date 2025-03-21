{
  programs = {
    lazygit = {
      enable = true;
      settings = {
        promptToReturnFromSubprocess = false;
        notARepository = "skip";
        disableStartupPopups = true;
      };
    };
  };
}
