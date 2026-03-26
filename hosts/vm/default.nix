# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/displayManager/gdm
    ../../modules/desktopManager/gnome
    ../../modules/tilingWindowManager/hyprland
    ../../modules/system
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "vm-nixos";

  system.stateVersion = "25.11";
}
