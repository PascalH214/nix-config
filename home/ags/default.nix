{ ... }: {
  xdg.configFile."ags" = {
    source = ./config;
    recursive = true;
  };
}
