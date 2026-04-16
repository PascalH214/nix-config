{ 
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
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
  ];
}
