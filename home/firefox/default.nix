{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };
  };
}
