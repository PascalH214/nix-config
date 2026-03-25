{ pkgs, ... }: {
  xdg.configFile."wpaperd" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.wpaperd ];
}
