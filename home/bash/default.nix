{
  ...
}: {
  home.file = {
    # ".bash_exports".source = ./files/.bash_exports;
    # ".bash_profile".source = ./files/.bash_profile;
    # ".bashrc".source = ./files/.bashrc;
    # ".bash_ssh".source = ./files/.bash_ssh;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      svim = "sudoedit";
      cz = "chezmoi";

      c = "clear && if [[ $(which fastfetch) ]]; then fastfetch --config ~/.config/fastfetch/config.jsonc; fi;";

      ssh = "TERM=xterm ssh";

      ecmp = "f(){ 
        local file
        if [ -f docker-compose.yml ]; then
          file=docker-compose.yml
        elif [ -f compose.yml ]; then
          file=compose.yml
        else
          $EDITOR \"docker-compose.yml\"
          return 1
        fi
        $EDITOR \"$file\"
      }; f";
    };
    bashrcExtra = builtins.concatStringsSep "\n" (map builtins.readFile [
      ./files/rc/10-env.sh
      ./files/rc/20-rocm-gaming.sh
      ./files/rc/30-manpager.sh
      ./files/rc/40-tools.sh
      ./files/rc/50-interactive.sh
    ]);
    profileExtra = (builtins.readFile ./files/bash_profile);
  };
}