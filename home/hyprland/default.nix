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

  home.file.".config/hypr/hyprland.conf".text = ''
    $terminal = kitty
    $fileManager = yazi
    $menu = ags request toggle-launcher
    $mainMod = ${hyprMainMod}

    source=~/.config/hypr/envs.conf
    source=~/.config/hypr/auto-start.conf

    # navigation
    source=~/.config/hypr/keybindings.conf
    source=~/.config/hypr/input.conf 		# User-Configurations
    source=~/.config/hypr/devices.conf		# User-Configurations
    source=~/.config/hypr/layout.conf

    # style
    source=~/.config/hypr/style.conf
    source=~/.config/hypr/animations.conf
    source=~/.config/hypr/windowrules.conf

    # other
    source=~/.config/hypr/screensharing.conf

    # custom
    source=~/.config/hypr/monitor.conf		# User-Configurations

    general {
      layout = master
    }
  '';

  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$fileManager" = "yazi";
    "$menu" = "ags request toggle-launcher";
    "$mainMod" = hyprMainMod;
  };
}