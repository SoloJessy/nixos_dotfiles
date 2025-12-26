{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./systems-config.nix
    ./steam.nix
    ./desktopEnvironments/cosmic.nix
    # ./virt.nix
  ];

  environment.systemPackages = with pkgs; [
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
