{pkgs, ...}: {
  home.packages = with pkgs; [
    zoxide
  ];
  programs.bash = {
    bashrcExtra = ''
      eval "$(zoxide init bash)"
    '';
  };
}