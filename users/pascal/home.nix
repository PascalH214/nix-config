{pkgs, pkgsUnstable, inputs, ...}: {
  imports = [
    ../../home
  ];

  programs = {
    kitty.enable = true;
    git = {
      enable = true;
      settings.user = {
        name = "PascalH214";
        email = "pascal02012004@freenet.de";
      };
    };
  };

  home.packages = with pkgs; [
    github-copilot-cli
    zoxide
    ncpamixer
  ] ++ (with pkgsUnstable; [
    blesh
  ]);
}
