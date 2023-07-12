# command-prefix: n

switch +ARGS:
    sudo nixos-rebuild switch --flake {{ARGS}}

test +ARGS:
    sudo nixos-rebuild test --flake {{ARGS}}

garbage-collect:
    sudo nix-collect-garbage -d
    nix-collect-garbage -d

update:
    nix flake update

format:
    nixpkgs-fmt .
