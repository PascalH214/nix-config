{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    nodejs_24
    nil
  ];
}
