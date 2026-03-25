{ pkgs, ... }: {
  xdg.configFile."tmux" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.tmux ];
}
