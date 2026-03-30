# At the moment, this file imports all home-configuration modules.
# In the future, only modules that are common to all users should be imported here,
# and user-specific modules should be imported in the respective user.nix files.

{ ... }: {
  imports = [
    ./core.nix
    ./bash
    ./chrome
    ./hyprland
    ./ags
    ./btop
    ./fastfetch
    ./gnome
    ./kitty
    ./Kvantum
    ./lsd
    ./nvim
    ./oh_my_posh
    ./printers_scanners
    ./qt6ct
    ./rofi
    ./systemd
    ./tmux
    ./vsCode
    ./wpaperd
    ./xdg-desktop-portal
    ./yazi
  ];
}
