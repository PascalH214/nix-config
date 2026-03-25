{ ... }: {
  xdg.configFile."systemd" = {
    source = ./config;
    recursive = true;
  };
}
