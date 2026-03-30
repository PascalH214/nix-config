{
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    amdgpu_top
  ];

  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
  ];
}