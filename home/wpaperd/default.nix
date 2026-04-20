{config, ...}: {
  home.file.".wallpaper" = {
    source = ./wallpaper;
    recursive = true;
  };

  services.wpaperd = {
    enable = true;
    settings = {
      "re:.*" = {
        path = "${config.home.homeDirectory}/.wallpaper/lake_ultrawide.png";
      };
    };
  };
}
