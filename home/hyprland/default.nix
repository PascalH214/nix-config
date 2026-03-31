{ 
  lib,
  hyprMainMod ? "SUPER",
  username,
  ...
}: let
  configDir = ./config;
  configEntries = builtins.readDir configDir;
  topLevelConfigFiles = lib.filterAttrs (name: type: type == "regular" && name != "hyprland.conf") configEntries;
  configFileLinks = builtins.listToAttrs (
    map (name: {
      name = "hypr/${name}";
      value.source = configDir + "/${name}";
    }) (builtins.attrNames topLevelConfigFiles)
  );
in {
  xdg.configFile =
    configFileLinks
    // {
      "hypr/keybindings" = {
        source = ./config/keybindings;
        recursive = true;
      };

      "hypr/hyprland.conf".text = ''
        $terminal = kitty
        $fileManager = yazi
        $menu = ags request toggle-launcher
        $mainMod = ${hyprMainMod}

        source=~/.config/hypr/envs.conf
        source=~/.config/hypr/auto-start.conf

        # navigation
        source=~/.config/hypr/keybindings.conf
        source=~/.config/hypr/input.conf         # User-Configurations
        source=~/.config/hypr/layout.conf

        # style
        source=~/.config/hypr/style.conf
        source=~/.config/hypr/animations.conf
        source=~/.config/hypr/windowrules.conf

        # other
        source=~/.config/hypr/screensharing.conf

        # custom
        source=~/.config/hypr/monitor.conf       # User-Configurations

        general {
          layout = master
        }
      '';

      "hypr/scripts" = {
        source = ./scripts;
        recursive = true;
        executable = true;
      };
    };

  programs = {
    hyprlock = {
      enable = true;
    };
  };
}