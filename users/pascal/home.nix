{pkgs, ...}: {
  imports = [
    ../../home/core.nix
    ../../home/hyprland
    ../../home/vsCodium
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "PascalH214";
      email = "pascal02012004@freenet.de";
    };
  };

  programs.kitty.enable = true;
}
