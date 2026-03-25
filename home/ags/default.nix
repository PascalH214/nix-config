{ pkgs, ... }: {
  xdg.configFile."ags" = {
    source = ./config;
    recursive = true;
  };

  home.packages = [
    (if pkgs ? ags then pkgs.ags else pkgs.aylurs-gtk-shell)
  ];
}
