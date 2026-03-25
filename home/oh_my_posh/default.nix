{pkgs, ...}: {
  home.packages = with pkgs; [
    oh-my-posh
  ];
  programs.bash = {
    bashrcExtra = ''
      eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin_mocha.omp.json)"
    '';
  };
}