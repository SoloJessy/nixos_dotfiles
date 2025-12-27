{
  config,
  pkgs,
  inputs,
  ...
}:
{
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # services.xserver.videoDrivers = [ "amdgpu" ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  # programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    # lutris
    # bottles
    # heroic
    # wineWowPackages.full
    # winetricks
  ];
}
