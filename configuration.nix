{ pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./systems-config.nix
    ./steam.nix
    ./desktopEnvironments/cosmic-base.nix
    # ./desktopEnvironments/gnome.nix
    # ./desktopEnvironments/i3-base.nix
    ./virt.nix
    ./razer.nix
    inputs.nix-mineral.nixpsModules.nix-mineral
  ];

  nix-mineral = {
    enable = true;
    preset = "default";
  };

  environment.systemPackages = with pkgs; [
    framework-tool
    framework-tool-tui
    file
    p7zip
    bitwarden-desktop
    alacritty
    xorg.xinput
    helix
    git
    man-pages
    man-pages-posix
    firefox
    libreoffice
    hunspell
    hunspellDicts.en_GB-ise
  ];
}
