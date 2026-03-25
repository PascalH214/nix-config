{ ... }: {
  xdg.configFile."qt6ct" = {
    source = ./config;
    recursive = true;
  };
}
