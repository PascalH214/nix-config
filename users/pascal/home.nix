{pkgs, ...}: {
  imports = [
    ../../home/core.nix
  ];

  programs.git.settings.user = {
    name = "PascalH214";
    email = "pascal02012004@freenet.de";
  };
}
