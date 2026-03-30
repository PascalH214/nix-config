{ 
  username,
  ...
}: {
  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "console=/dev/null"
    ];
    plymouth.enable = true;
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam.gamescopeSession.enable = true;
  };
}