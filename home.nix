{ config, pkgs, ... }: {
  home.username = "jessy";
  home.homeDirectory = "/home/jessy";

  home.packages = with pkgs; [ nnn fzf ripgrep btop ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ nil ];
    settings = {
      theme = "monokai_pro_spectrum";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          file-types = [ "rs" ];
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }
        {
          name = "nix";
          language-servers = [ "nil" ];
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];
      language-server = {
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          checkOnSave.command = "${pkgs.clippy}/bin/clippy";
          procMacro.enable = true;
        };
      };
    };
  };

  programs.atuin = {
    enable = true;
    settings = {
      dialect = "uk";
      inline_height = "10";
    };
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    extraOptions = [
      "--colour-scale=all"
      "--colour-scale-mode=gradient"
      "--icons=always"
      "--all"
      "--group-directories-first"
      "--long"
      "--smart-group"
      "--header"
    ];
  };

  programs.git = {
    enable = true;
    userName = "Sam Bartley";
    userEmail = "SoloJessy.rs@gmail.com";
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
    shellAliases = { };
  };

  home.stateVersion = "25.05";
}
