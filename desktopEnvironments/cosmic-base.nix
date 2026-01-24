{ pkgs, ... }:
{
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.system76-scheduler.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
  ];

  # services.blueman.enable = true;
  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
