{ ... }: {
  xdg.configFile."yazi" = {
    source = ./config;
    recursive = true;
  };
}
