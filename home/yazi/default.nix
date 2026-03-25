{ pkgs, ... }: {
  xdg.configFile."yazi" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.yazi ];
}
