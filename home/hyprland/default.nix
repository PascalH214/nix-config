{ ... }: {
  xdg.configFile = {
    "hypr" = {
      source = ./config;
      recursive = true;
    };

    "hypr/scripts" = {
      source = ./scripts;
      recursive = true;
      executable = true;
    };
  };
}