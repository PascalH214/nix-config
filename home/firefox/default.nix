{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        extensions.autoDisableScope = 0;
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };
  };
}
