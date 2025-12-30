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
        i3a
        feh
        cosmic-wallpapers
        pavucontrol
        pamixer
        bluez
        bluez-tools
      ];
    };
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  services.blueman.enable = true;
}
