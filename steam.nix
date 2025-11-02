{ config, pkgs, inputs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32bit = true;
  };

  # services.xserver.videoDrivers = [ "amdgpu" ];
}
