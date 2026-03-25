{ pkgs, ... }: {
  xdg.configFile."btop" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.btop ];
}
