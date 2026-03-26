{pkgs, ...}: {
  imports = [
    ../../home
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
