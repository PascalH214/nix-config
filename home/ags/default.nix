{ inputs, pkgs, ... }: {
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = ./config;
    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.mpris
      inputs.astal.packages.${pkgs.system}.notifd
      fzf
    ];
  };
}
