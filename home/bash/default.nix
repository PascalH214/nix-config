{ ... }: {
  home.file = {
    ".bash_alias".source = ./files/.bash_alias;
    ".bash_exports".source = ./files/.bash_exports;
    ".bash_profile".source = ./files/.bash_profile;
    ".bashrc".source = ./files/.bashrc;
    ".bash_ssh".source = ./files/.bash_ssh;
  };
}
