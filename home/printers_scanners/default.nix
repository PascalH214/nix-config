{ ... }: {
  xdg.configFile."printers_scanners" = {
    source = ./config;
    recursive = true;
  };
}
