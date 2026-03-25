{ pkgs, ... }: {
  xdg.configFile."fastfetch" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.fastfetch ];
}
