{ pkgs, ... }: {
  xdg.configFile."qt6ct" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.qt6ct ];
}
