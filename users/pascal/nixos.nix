{ pkgs, ... }:

{
  users = {
    users = {
      pascal = {
        isNormalUser = true;
        description = "pascal";
        extraGroups = [ "networkmanager" "wheel" "adbusers" ];
        packages = with pkgs; [];
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
