{ pkgs, ... }:

{
  users = {
    users = {
      pascal = {
        isNormalUser = true;
        description = "pascal";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
