{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      size = 13;
      name = "0xProto Nerd Font";
    };
    extraConfig = ''
      include catppuccin_mocha.conf
      cursor_shape block
      shell_integration no-cursor
      window_padding_width 10
    '';
    themeFile = "Catppuccin-Mocha";
  };
}
