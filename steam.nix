{ config, pkgs, inputs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # services.xserver.videoDrivers = [ "amdgpu" ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    lutris
    bottles
    heroic
  ];
}
