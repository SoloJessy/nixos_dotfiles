{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  fonts.fontconfig.enable = true;
  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;

  hardware.bluetooth.enable = true;
  hardware.openrazer.enable = true;
  services.fprintd.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the MATE Desktop Environment.

  # Configure console keymap
  # console.keyMap = "uk";
  console.keyMap = "uk";
  services.xserver = {
    xkb.layout = "gb";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pulseaudio.support32Bit = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jessy = {
    isNormalUser = true;
    description = "Sam Bartley";
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
      "openrazer"
      "plugdev"
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jessy";

  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
          };
          shift = {
            capslock = "capslock";
          };
          # mouse1 (rear side button)
          # mouse2 (front side button)
        };
      };
    };
  };
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntergration=internal
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
