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

update-single +ARGS:
    nix flake lock --update-input {{ARGS}}

lint:
    nixpkgs-fmt .

test-notifications:
    notify-send "Hello world! 00"
