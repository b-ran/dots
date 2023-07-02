nix-shell -p git
nixos-generate-config --root /mnt
cp -r /mnt/etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .#brandon

