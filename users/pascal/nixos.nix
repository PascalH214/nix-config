{ ... }:

{
  users = {
    users = {
      pascal = {
        isNormalUser = true;
        description = "pascal";
        extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" "kvm" "libvirtd" ];
        packages = [];
      };
    };
  };

  hardware.openrazer.enable = true;
}
