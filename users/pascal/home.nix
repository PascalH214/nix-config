{ pkgs, pkgsUnstable, ... }: {
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

  home.packages =
    with pkgs; [
      # Fonts
      nerd-fonts._0xproto

      # Core CLI tools
      git
      nodejs_24
      nil
      ripgrep
      fd
      less
      wget
      unzip
      zoxide

      # Development tools
      python3
      luarocks
      gcc
      lua
      ghostscript
      lazygit
      github-copilot-cli
      mermaid-cli
      texliveSmall

      # Desktop and theme utilities
      adw-gtk3
      gnome-themes-extra
      dconf
      openrazer-daemon
      ncpamixer
      discord
      feishin
      bluetui
      impala

      # Android / device tooling
      scrcpy
      android-tools

      # Containers / Kubernetes
      distrobox
      podman-compose
      kind
      kubectl
      k9s
      fluxcd
      kubernetes-helm
    ]
    ++ (with pkgsUnstable; [
      blesh
    ]);

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
