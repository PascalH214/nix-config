{ ... }: {
  xdg.configFile."lsd" = {
    source = ./config;
    recursive = true;
  };
}
