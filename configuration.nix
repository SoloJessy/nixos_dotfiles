{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./systems-config.nix
    ./steam.nix
    ./desktopEnvironments/cosmic-base.nix
    # ./desktopEnvironments/gnome.nix
    # ./desktopEnvironments/i3-base.nix
    ./virt.nix
  ];

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
    openrazer-daemon
    razer-cli
    man-pages
    man-pages-posix
    firefox
    libreoffice
    hunspell
    hunspellDicts.en_GB-ise
  ];
}
