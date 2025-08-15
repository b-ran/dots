# Overview

This project is NixOS configuration for local desktop environment. It's primarily used as my personal daily driver OS 
setup and includes configuration for linux and macOS found in the `darwin` directory. The mac configuration is used 
on my MacBook though it is not my primary machine, and it is not as actively maintained as the NixOS configuration.
Note this configuration uses NixOS flakes, a more experimental feature of NixOS hence it uses the unstable channel. 
The system that uses this configuration makes use of nvidia graphics drivers, and any changes should support this.

The configuration creates a desktop experience using Hyprland and Wayland. All changes should only be made supporting Wayland only and not X11.

# Dependencies

This NixOS configuration uses the following flake inputs:

- `nixpkgs`: The Nix Packages collection, which provides the packages and modules used in the configuration.
- `home-manager`: A tool for managing user environments in NixOS, which simplifies the configuration of user-specific settings and applications.
- `stylix`: A theming framework for NixOS, which provides a set of themes and configurations for the desktop environment.
- `hyprland`: A dynamic tiling Wayland compositor that is used as the window manager in this configuration.
- `darwin`: A NixOS module for macOS, which provides support for configuring macOS systems using Nix.

# Links

- [NixOS](https://nixos.org/)
- [Nixpkgs - Search for all available packages for NixOS](https://search.nixos.org/packages?channel=unstable)
- [NixOS Options - Search for all available options for NixOS](https://search.nixos.org/options?channel=unstable)
- [NixOS Wiki - Official Wiki for NixOS](https://wiki.nixos.org)
- [NixOS Discourse - Official NixOS forum](https://discourse.nixos.org/)
- [Home Manager Options - All available options for Home Manager](https://nix-community.github.io/home-manager/options.html)
- [Hyprland Wiki - Official Hyprland documentation](https://wiki.hyprland.org/)
- [Stylix - Official Stylix documentation](https://nix-community.github.io/stylix/)