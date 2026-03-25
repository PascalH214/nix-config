{ ... }: {
  xdg.configFile."Kvantum" = {
    source = ./config;
    recursive = true;
  };
}
