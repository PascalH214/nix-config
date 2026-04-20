{pkgs, pkgsUnstable, ...}: {
  imports = [
    ../../home
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    PAGER = "less";
  };

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
    nerd-fonts._0xproto
    git
    nodejs_24
    nil
    adw-gtk3
    gnome-themes-extra
    dconf
    scrcpy
    android-tools
    ripgrep
    python3
    luarocks
    gcc
    ghostscript
    lazygit
    fd
    lua
    wget
    unzip
    less
    distrobox
    podman-compose
    openrazer-daemon
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
    fluxcd
    kubernetes-helm
  ] ++ (with pkgsUnstable; [
    blesh
  ]);

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
