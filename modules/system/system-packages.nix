{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    nodejs_24
    nil
    adw-gtk3
    gnome-themes-extra
    dconf
    scrcpy
    android-tools
  ];
}
