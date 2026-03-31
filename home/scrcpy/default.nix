{
  config,
  pkgs,
  ...
}:
{
  systemd.user.services."scrcpy" = {
    Unit = {
      Description = "scrcpy client for device with serial %i";
      Documentation = [ "man:scrcpy(1)" ];
      ConditionPathExists = "%E/scrcpy/autostart/%i";
    };

    Service = {
      Environment = [
        "ARGS=--stay-awake --turn-screen-off --power-off-on-close --max-fps 10 --render-driver=opengl"
        "DISPLAY=:0"
        "XAUTHORITY=%h/.Xauthority"
      ];

      EnvironmentFile = [
        "-%E/scrcpy/autostart/DEFAULTS"
        "%E/scrcpy/autostart/%i"
      ];

      ExecStart = "${pkgs.scrcpy}/bin/scrcpy -s %i $ARGS";

      Restart = "on-failure";
      RestartSec = 2;
      SuccessExitStatus = "2";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}