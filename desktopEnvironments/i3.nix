{ pkgs, ... }:
{
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };
}
