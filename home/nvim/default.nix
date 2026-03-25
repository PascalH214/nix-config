{ pkgs, ... }: {
  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [ pkgs.neovim ];
}
