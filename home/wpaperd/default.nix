{ ... }: {
  xdg.configFile."wpaperd" = {
    source = ./config;
    recursive = true;
  };
}
