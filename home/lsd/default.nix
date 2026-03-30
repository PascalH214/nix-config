{ pkgs, ... }: {
  xdg.configFile."lsd" = {
    source = ./config;
    recursive = true;
  };

  programs.lsd = {
    enable = true;
  };
}
