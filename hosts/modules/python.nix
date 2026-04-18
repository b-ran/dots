{ pkgs, system, ... }:

{
  environment.systemPackages = with pkgs; ([
    python312
    python312Packages.pip
  ]);
}