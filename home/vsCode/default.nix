{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        yzhang.markdown-all-in-one
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
      ];
      userSettings = {
        "editor" = {
          "lineNumbers" = "relative";
        };
        "workbench" = {
          "colorTheme" = "Catppuccin Mocha"; 
        };
      };
    };
  };
}