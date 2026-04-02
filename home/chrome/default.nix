{ pkgs, ... }: {
  programs.chromium = {
    enable = true;

    extensions = [
      "bkkmolkhemgaeaeggcmfbghljjjoofoh" # catppuccin chrome theme - mocha
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "gighmmpiobklfepjocnamgkkbiglidom" # AdBlock
    ];

    dictionaries = [
      pkgs.hunspellDictsChromium.en_US
      pkgs.hunspellDictsChromium.de_DE
    ];

    commandLineArgs = [
      "https://glance.pascal-lab.com/"
      "--new-window"
    ];
  };
}