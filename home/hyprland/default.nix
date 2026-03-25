{ hyprMainMod ? "SUPER", ... }: {
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

  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$fileManager" = "yazi";
    "$menu" = "ags request toggle-launcher";
    "$mainMod" = hyprMainMod;
  };
}