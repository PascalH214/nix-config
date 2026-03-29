{ pkgs, ... }: {
  home.file.".wallpaper" = {
    source = ./wallpaper;
    recursive = true;
  };

  services.wpaperd = {
    enable = true;
    settings = {
      "re:.*" = {
        path = "/home/pascal/.wallpaper/lake_ultrawide.png";
      };
    };
  };
}
