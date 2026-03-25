{ pkgs, ... }: {
  xdg.configFile."kitty" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.kitty ];
}
