{ ... }: {
  services.openiscsi = {
    enable = true;
    name = "iqn.2026-04.local:storage";
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    waydroid.enable = true;
  };
}
