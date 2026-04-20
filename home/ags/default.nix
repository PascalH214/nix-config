{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in {
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs; [
      inputs.astal.packages.${system}.hyprland
      inputs.astal.packages.${system}.mpris
      inputs.astal.packages.${system}.notifd
      fzf
    ];
  };
}
