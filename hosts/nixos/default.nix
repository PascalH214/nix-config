# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix

    ./hardware-configuration.nix

    ../../modules/desktopManager/gnome
    ../../modules/displayManager/gdm
    ../../modules/steam
    ../../modules/system
    ../../modules/tilingWindowManager/hyprland
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  system.stateVersion = "25.11";
}
