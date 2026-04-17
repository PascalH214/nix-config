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

    ../../modules/bootloader/grub
    ../../modules/desktopManager/gnome
    ../../modules/displayManager/gdm
    ../../modules/gpu/amd
    ../../modules/steam
    ../../modules/system
    ../../modules/tilingWindowManager/hyprland
  ];

  networking.hostName = "nixos";

  boot.kernelModules = [ "kvm-amd" ];

  system.stateVersion = "25.11";
}
