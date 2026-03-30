{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
    };
    themes = {
      "catppuccin_mocha" = builtins.readFile ./files/catppuccin_mocha.theme;
    };
  };
}
