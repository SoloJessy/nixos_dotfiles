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
    ./razer.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
    override = {
      # inspired by Monokai Pro Spectrum
      base00 = "#222222";
      base01 = "#363537";
      base02 = "#525053";
      base03 = "#69676c";
      base04 = "#8b888f";
      base05 = "#f7f1ff";
      base06 = "#f7f1ff";
      base07 = "#f7f1ff";

      base08 = "#f92672";
      base09 = "#fd971f";
      base0A = "#fce566";
      base0B = "#a6e22e";
      base0C = "#66d9ef";
      base0D = "#a1efe4";
      base0E = "#ae81ff";
      base0F = "#cc6633";
    };
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
