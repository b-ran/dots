# Linux Setup TODO

nix-shell -p git
nixos-generate-config --root /mnt
cp -r /mnt/etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .#brandon

# Darwin Setup

These are install instructions on how to install this darwin config from
a fresh macbook

## Install Nix
```console
sh <(curl -L https://nixos.org/nix/install)
```

## Setup Nix
```console
mkdir ~/.config/
mkdir ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Install X-Code
```console
xcode-select --install
```

## Setup Homebrew
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/brandon/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Setup workspace
```console
mkdir ~/workspace
cd ~/workspace
git clone https://github.com/b-ran/nixos-config
cd nixos-config
```

## First Darwin Flake Build
```console
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```
## Post Darwin Flake Rebuilds
```console
just switch
```