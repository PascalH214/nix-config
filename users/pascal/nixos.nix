{ pkgs, ... }:

{
  users = {
    users = {
      pascal = {
        isNormalUser = true;
        description = "pascal";
        extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" "kvm" "libvirtd" ];
        packages = with pkgs; [];
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
  ];
}
