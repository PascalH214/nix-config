{ ... }: {
  networking = {
    networkmanager = {
      enable = false;
      wifi.backend = "iwd";
    };
    wireless.enable = false; # disables wpa_supplicant
    wireless.iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };
}
