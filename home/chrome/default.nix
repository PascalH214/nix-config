{ pkgs, ... }: {
  programs.chromium = {
    enable = true;

    extensions = [
      "bkkmolkhemgaeaeggcmfbghljjjoofoh" # catppuccin chrome theme - mocha
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "gighmmpiobklfepjocnamgkkbiglidom" # AdBlock
    ];
  };
}