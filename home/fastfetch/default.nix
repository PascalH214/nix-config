{ pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "/home/pascal/.config/fastfetch/NixOS.txt";
        padding = {
          right = 3;
          bottom = 2;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
	      "break"
	      "break"
	      {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " ";
          keyColor = "33";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "33";
        }
        {
          type = "packages";
          format = "{} (pacman)";
          key = " ";
          keyColor = "33";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "33";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "33";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "33";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "33";
        }
        {
          type = "media";
          key = "󰝚 ";
          keyColor = "33";
        }
        "break"
        "colors"
        "break"
        "break"
      ];
    };
  };

  xdg.configFile."fastfetch/NixOS.txt".source = ./files/NixOS.txt;
}
