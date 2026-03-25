{ ... }: {
  xdg.configFile."xdg-desktop-portal" = {
    source = ./config;
    recursive = true;
  };
}
