{pkgs, ...}: {
  home.packages = with pkgs; [
    oh-my-posh
  ];

  home.file.".poshthemes" = {
    source = ./poshthemes;
    recursive = true;
  };
}