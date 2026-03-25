{ pkgs, ... }: {
  xdg.configFile."rofi" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.rofi ];
}
