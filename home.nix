{ config, pkgs, ... }: {
  home.username = "jessy";
  home.homeDirectory = "/home/jessy";

  home.packages = with pkgs; [ nnn fzf ripgrep btop hexyl ]; # broot

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      marksman
      nodePackages.prettier
      ltex-ls-plus
    ];
    settings = {
      theme = "monokai_pro_spectrum";
      editor = {
        line-number = "relative";
        rulers = [ 80 ];
        bufferline = "multiple";
        color-modes = true;
        mouse = false;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        auto-save.focus-lost = true;
        indent-guides.render = true;
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
          file-types = [ "nix" ];
          language-servers = [ "nil" ];
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "markdown";
          file-types = [ "md" ];
          language-servers = [ "marksman" "ltex-ls-plus" ];
          soft-wrap.enable = true;
          soft-wrap.wrap-indicator = "";
          soft-wrap.wrap-at-text-width = true;
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "markdown" "--prose-wrap" "never" ];
            auto-format = true;
          };
        }
      ];
      language-server = {
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          checkOnSave.command = "${pkgs.clippy}/bin/clippy";
          procMacro.enable = true;
        };
        marksman = { command = "${pkgs.marksman}/bin/marksman"; };
        ltex-ls-plus = {
          command = "${pkgs.ltex-ls-plus}/bin/ltex-ls-plus";
          ltex.diagnosticSeverity = "warning";
          ltex.ltex-ls.logLevel = "warning";
          ltex.disabledRules = {
            "en-US" = [ "PROFANITY" ];
            "en_GB" = [ "PROFANITY" ];
          };
          ltex.dictionary = {
            "en-US" = [ "builtin" ];
            "en-GB" = [ "builtin" ];
          };
        };
      };
    };
  };

  programs.atuin = {
    enable = true;
    settings = {
      dialect = "uk";
      inline_height = "10";
      enter_accept = true;
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

  programs.bat = {
    enable = true;
    theme = "onehalfdark";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      line-numbers = true;
    };
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
    shellAliases = { cat = "bat -s"; };
  };

  home.stateVersion = "25.05";
}
