<div align="center">
    <img alt="Profiles Pictures" src="https://raw.githubusercontent.com/b-ran/dots/main/.assests/profile1.png" width="200" height="200">
</div>

<div align="center">
    <a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&color=73DACA&center=true&vCenter=true&repeat=false&random=false&width=435&lines=%E2%9D%84%EF%B8%8F+Bran's+Dots+%E2%9D%84%EF%B8%8F" alt="Typing SVG"></a>
</div>


<p align="center">
    <a href="https://nixos.org/">
        <img alt="nixos unstable" src="https://img.shields.io/badge/NixOS-unstable-informational.svg?style=flat&logo=nixos&logoColor=5178C4&colorA=1A1B26&colorB=7FBBE5">
    </a>
    <a href="https://hyprland.org/">
        <img alt="hyprland" src="https://img.shields.io/static/v1?label=Hyprland&message=latest&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5">
    </a>
    <a href="https://github.com/b-ran/dots/issues">
        <img alt="issues" src="https://img.shields.io/github/issues/b-ran/dots?&style=for-the-badge&style=flat&colorA=24273A&">
    </a>
    <a href="https://github.com/b-ran/dots/issues">
        <img alt="GitHub License" src="https://img.shields.io/github/license/b-ran/dots?&style=for-the-badge&style=flat&colorA=24273A&">
    </a>
</p>

<hr>

# 🗺️ Overview

This my personal NixOS flake configuration, for my daily driver. It uses a mix of NixOS, Home-Manager, Agenix, and 
Stylix to manage the system. Note it's not recommended to use this configuration as is, as it's tailored to my needs.
Feels free to use it as a reference or a starting point for your own configuration.

# 🌌 Screenshots

![](./.assests/screenshot-desktop1.png)
![](./.assests/screenshot-lockscreen1.png)
![](./.assests/screenshot-rofi1.png)


![](./.assests/screenshot-desktop2.png)
![](./.assests/screenshot-lockscreen2.png)
![](./.assests/screenshot-rofi2.png)


![](./.assests/screenshot-desktop3.png)
![](./.assests/screenshot-lockscreen3.png)
![](./.assests/screenshot-rofi3.png)


# 🩻 Components

|                       | NixOS Wayland                                                  |
|-----------------------|----------------------------------------------------------------|
| **Window Manager**    | [Hyprland](https://hyprland.org/)                              |
| **Terminal Emulator** | [Alacritty](https://github.com/alacritty/alacritty)            |
| **Bar**               | [Waybar](https://github.com/alexays/waybar)                    |
| **Launcher**          | [Rofi Wayland](https://github.com/lbonn/rofi)                  |
| **Display Manager**   | [SDDM](https://github.com/sddm/sddm)                           |
| **Theme Manager**     | [Stylix](https://github.com/danth/stylix)                      |
| **Wallpaper Manager** | [Swww](https://github.com/LGFae/swww)                          |
| **Notifications**     | [Dunst](https://github.com/dunst-project/dunst)                |
| **Lock Screen**       | [Hyprlock](https://github.com/hyprwm/hyprlock)                 |
| **File Manager**      | [Nautilus](https://apps.gnome.org/Nautilus/)                   |
| **USB Mounting**      | [Udiskie](https://github.com/coldfix/udiskie)                  |
| **Shell**             | [Zsh](https://www.zsh.org/) + [Starship](https://starship.rs/) |
| **Media Player**      | [MPV](https://mpv.io/)                                         |
| **Web Browser**       | [Firefox](https://www.mozilla.org/en-US/firefox/new/)          |

# ⌨️ Keybindings

| Keys                                                                                                                         | Action                                             |
|------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------|
| <kbd>Super</kbd> + <kbd>C</kbd>                                                                                              | Close focused window                               |
| <kbd>Super</kbd> + <kbd>F</kbd>                                                                                              | Fullscreen focused window                          |
| <kbd>Super</kbd> + <kbd>P</kbd>                                                                                              | Pseudo focused window                              |
| <kbd>Super</kbd> + <kbd>G</kbd>                                                                                              | Group focused window                               |
| <kbd>Super</kbd> + <kbd>H</kbd>                                                                                              | Toggle window split                                |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>                                                                           | Toggle window float                                |
| <kbd>Super</kbd> + <kbd>Enter</kbd>                                                                                          | Open terminal                                      |
| <kbd>Super</kbd> + <kbd>L</kbd>                                                                                              | Lock screen                                        |
| <kbd>Super</kbd> + <kbd>D</kbd>                                                                                              | Open application launcher                          |
| <kbd>Super</kbd> + <kbd>B</kbd>                                                                                              | Open wallpaper picker                              |
| <kbd>Super</kbd> + <kbd>N</kbd>                                                                                              | Open network menu                                  |
| <kbd>Super</kbd> + <kbd>W</kbd>                                                                                              | Open windows menu                                  |
| <kbd>Super</kbd> + <kbd>X</kbd>                                                                                              | Open power menu                                    |
| <kbd>Super</kbd> + <kbd>V</kbd>                                                                                              | Open clipboard menu                                |
| <kbd>Super</kbd> + <kbd>Y</kbd>                                                                                              | Open waybar layout menu                            |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>                                                                           | Open screenshot menu                               |
| <kbd>Super</kbd> + <kbd>S</kbd>                                                                                              | Screenshot tool                                    |
| <kbd>Super</kbd> + <kbd>R</kbd>                                                                                              | Screen recorder tool                               |
| <kbd>Super</kbd> + <kbd>E</kbd>                                                                                              | Eyedropper tool                                    |
| <kbd>Super</kbd> + <kbd>O</kbd>                                                                                              | OCR tool                                           |
| <kbd>Super</kbd> + <kbd>[0-9]</kbd>                                                                                          | Switch workspaces                                  |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>↓</kbd>                                                                            | Move to the first empty workspace                  |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>[0-9]</kbd>                                                                       | Move focused window to a workspace                 |
| <kbd>Super</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>                                                          | Move window focus                                  |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>←</kbd><kbd>→</kbd><br/> <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>Mouse Wheel</kbd> | Switch workspaces to a relative workspace          |
| <kbd>Super</kbd> + <kbd>RMB</kbd> + <kbd>Drag</kbd>                                                                          | Resize focus window                                |
| <kbd>Super</kbd> + <kbd>LMB</kbd> + <kbd>Drag</kbd>                                                                          | Move focus window                                  |
| <kbd>Super</kbd> + <kbd>Tab</kbd>                                                                                            | Open special workspace                             |
| <kbd>Super</kbd> + <kbd>=</kbd>                                                                                              | Move focus to special workspace                    |
| <kbd>Super</kbd> + <kbd>+</kbd>                                                                                              | Move special workspace focus in relative workspace |

# 🧑‍🔧 Setup

This setup assume modern hardware with UEFI support.

## 🗒️ Initial

Download NixOS minimal unstable ISO from [here](https://releases.nixos.org/nixos/unstable).

Create a bootable USB drive with the ISO, Ventoy is recommended.

Boot into the USB drive using UEFI mode, else the grub installation will fail near the end.

You are logged in automatically as nixos in terminal. nixos has empty password with sudo access.
Switch to root with `sudo su`.

## 🖨️ Installing

This configuration uses [disko](https://github.com/nix-community/disko) for declarative disk partitioning. Disko will automatically partition, format, mount, and install NixOS in one command.

### Available Hosts

- **desktop**: Desktop system with 32GB swap (for systems with 32GB+ RAM)
- **framework**: Framework 13 laptop with 16GB swap (for 16GB RAM)

Both configurations create:
- **Boot partition (ESP)**: 1024 MiB FAT32 mounted at `/boot` (unencrypted)
- **LUKS encrypted partition** containing LVM with:
  - **Swap LV**: 32GB (desktop) or 16GB (framework)
  - **Root LV**: Remaining space (ext4, encrypted) mounted at `/`

1. Clone repo.
    ```
    nix-shell -p git
    git clone https://github.com/b-ran/dots /tmp/nixos-config
    cd /tmp/nixos-config
    ```

2. **(Optional)** Customize partitioning. Find your target drive with `lsblk`. Default is `/dev/nvme0n1`.
   If you need a different drive or swap size, edit the appropriate config:
    ```
    nano hosts/desktop/disko-config.nix    # For desktop
    nano hosts/framework/disko-config.nix  # For framework
    ```

3. Run disko to partition, format, mount, and install in one command. Replace `desktop` with `framework` if installing on Framework.
    ```
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
      --mode disko --flake .#desktop
    ```
    **⚠️ WARNING**: This will erase all data on the target drive!

    You'll be prompted to enter your disk encryption password during the process. Remember this password - you'll need it every time you boot.

4. If everything goes well, reboot. You should be greeted with the login screen. May need to remove the USB drive.
    ```
    reboot
    ```
    You'll be prompted for your disk encryption password at boot.