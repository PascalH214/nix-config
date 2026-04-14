{pkgs, pkgsUnstable, inputs, ...}: {
  imports = [
    ../../home
  ];

  programs = {
    kitty.enable = true;
    thunderbird = {
      enable = true;
      profiles.default.isDefault = true;
    };
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
    discord
    feishin
    bluetui
    impala
    texliveSmall
    mermaid-cli
    kind
    kubectl
  ] ++ (with pkgsUnstable; [
    blesh
  ]);

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
