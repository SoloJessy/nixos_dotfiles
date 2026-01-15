{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    # razer-cli
    # polychromatic
  ];
  hardware.openrazer.enable = true;
}
