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

Restart your terminal

## Setup Nix
```console
mkdir ~/.config/ &&
mkdir ~/.config/nix &&
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Install X-Code
```console
xcode-select --install
```

## Setup Homebrew
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" &&
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile &&
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Setup workspace
```console
mkdir ~/workspace &&
cd ~/workspace &&
git clone https://github.com/b-ran/nixos-config
```

## Disable SIP for Full Yabai Support
https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

## First Darwin Flake Build
```console
cd ~/workspace/nixos-config &&
sudo mv /etc/shells /etc/shells.before-nix-darwin &&
nix run nix-darwin -- switch --flake .#mac
```

Restart your computer

## Post Darwin Flake Rebuilds
```console
just switch
```



### Color Schemas Mapping 
Background - dark background color
Foreground & Cursor - text readable color on background
Color0 - Black
Color1 - Red
Color2 - Green
Color3 - Yellow
Color4 - Blue
Color5 - Magenta
Color6 - Cyan
Color7 - White
Color8 - Alt Black
Color9 - Alt Red
Color10 - Alt Green
Color11 - Alt Yellow
Color12 - Alt Blue
Color13 - Alt Magenta
Color14 - Alt Cyan
Color15 - Alt White