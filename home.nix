{ config, pkgs, ... }:
{
  home.username = "jessy";
  home.homeDirectory = "/home/jessy";

  home.packages = with pkgs; [
    neofetch
    nnn

    eza
    fzf
    ripgrep

    btop
    iotop
    iftop

    starship
  ];

  programs.git = {
    enable = true;
    # userName = "Sam Bartley";
    # userEmail = "SoloJessy.rs@gmail.com";
    settings = {
      user.name = "Sam Bartley";
      user.email = "SoloJessy.rs@gmail.com";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -la";
    };
  };

  home.stateVersion = "25.05";
}
