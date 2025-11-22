{ config, pkgs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./systems-config.nix
    ./steam.nix
    ./virt.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Dev programs
    helix
    git
    openrazer-daemon
    razer-cli

    #General System Wide Programs
    firefox
    libreoffice
    hunspell
    hunspellDicts.en_GB-ise
  ];
}
