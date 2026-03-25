{ pkgs, ... }: {
  xdg.configFile."Kvantum" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.kvantum ];
}
