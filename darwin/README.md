# Darwin Setup

These are install instructions on how to install this darwin config from 
a fresh macbook

## Install Nix

sh <(curl -L https://nixos.org/nix/install)

## Install X-Code
xcode-select --install

## Setup Nix
mkdir ~/.config/nix

## Setup Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/brandon/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

## Setup workspace
mkdir ~/workspace
cd ~/workspace
git clone https://github.com/b-ran/nixos-config
cd nixos-config

## First Darwin Flake Build
nix-env -iA nixpkgs.git
nix build .#darwinConfigurations.mac.system
./result/sw/bin/darwin-rebuild switch --flake .#mac

## Post Darwin Flake Rebuilds
darwin-rebuild switch --flake .#mac
