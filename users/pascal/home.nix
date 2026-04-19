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
      settings = {
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
        user = {
          name = "PascalH214";
          email = "pascal02012004@freenet.de";
        };
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
    k9s
    flux
  ] ++ (with pkgsUnstable; [
    blesh
  ]);

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
