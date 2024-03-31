{ pkgs, system, ... }:

{
  environment.systemPackages = with pkgs; ([
    python312
    python312Packages.pip
    pre-commit
    rustc  # for ruff
    cargo  # for ruff
  ]);
}