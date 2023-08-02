{ pkgs, old-pkgs, system, ... }:

{
  environment.systemPackages = with pkgs; ([
    python311
    python311Packages.pip
    python310
    pre-commit
    rustc  # for ruff
    cargo  # for ruff

  ]) ++ (with old-pkgs.legacyPackages.${system}; [
    # <https://discourse.nixos.org/t/python3-8-sphinx-build-failure-on-unstable/29102/11?u=stianlagstad>
    python38
    python39
  ]);
}