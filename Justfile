# command-prefix: n

[linux]
switch +ARGS:
    sudo nixos-rebuild switch --flake {{ARGS}}

[linux]
test +ARGS:
    sudo nixos-rebuild test --flake {{ARGS}}

[macos]
switch +ARGS:
    darwin-rebuild switch --flake .#mac

[macos]
test +ARGS:
    darwin-rebuild test --flake .#mac

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

