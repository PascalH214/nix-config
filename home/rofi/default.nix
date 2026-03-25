{ ... }: {
  xdg.configFile."rofi" = {
    source = ./config;
    recursive = true;
  };
}
