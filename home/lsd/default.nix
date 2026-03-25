{ pkgs, ... }: {
  xdg.configFile."lsd" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.lsd ];
}
