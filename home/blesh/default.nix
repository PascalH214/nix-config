{pkgs, ...}: {
  home.packages = with pkgs; [
    blesh
  ];
  programs.bash = {
    bashrcExtra = ''
      [[ $- == *i* ]] && source -- "$(blesh-share)"/ble.sh --attach=none
      ...
      [[ ! ''${BLE_VERSION-} ]] || ble-attach
      bleopt color_scheme=catppuccin_mocha
    '';
  };
}