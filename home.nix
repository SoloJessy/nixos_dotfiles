{ config, pkgs, lib, ... }: {
  home.username = "jessy";
  home.homeDirectory = "/home/jessy";

  home.packages = with pkgs; [
    polychromatic
    obsidian
    nnn
    fzf
    ripgrep
    btop
    hexyl
    delta
  ];

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
          command = "${pkgs.rust-analyzer-nightly}/bin/rust-analyzer";
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
    config = { theme = "onehalfdark"; };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  # programs.delta = {
  #   enable = true;
  #   enableGitIntegration = true;
  #   options = {
  #     side-by-side = true;
  #     line-numbers = true;
  #   };
  # };

  programs.git = {
    enable = true;
    userName = "Sam Bartley";
    userEmail = "SoloJessy.rs@gmail.com";
    delta.enable = true;
    extraConfig = {
      core = { pager = "${pkgs.delta}/bin/delta"; };
      interactive = { diffFilter = "${pkgs.delta}/bin/delta --color-only"; };
      delta = {
        navigate = true;
        dark = true;
      };
      merge = { conflictStyle = "zdiff3"; };
    };
  };

  programs.starship = {
    enable = true;
    enableInteractive = true;
    settings = {
      time.disabled = false;
      time.format = "\\[[$time]($style)\\] ";
      battery.format = "\\[[$symbol$percentage]($style)\\] ";
      git_branch.format = "\\[[$symbol$branch]($style)\\] ";
      git_commit.only_detached = false;
      git_commit.format = "\\[[$hash$tag]($style)\\] ";
      git_metrics.disabled = false;
      git_metrics.only_nonzero_diffs = false;
      git_metrics.format =
        "\\[([+$added]($added_style))\\] \\[([-$deleted]($deleted_style))\\] ";
      git_state.format =
        "\\[[$state ($progress_current/$progress_total)]($style)\\] ";
      # git_status.format = "\\[[$all_status$ahead_behind]($style)\\] ";
      package.format = "\\[[$symbol$version]($style)\\] ";
      rust.format = "\\[[$symbol$version]($style)\\] ";
      status.format = "\\[[$symbol$status]($style)\\] ";
      sudo.disabled = false;
      sudo.style = "bold red";
      sudo.format = "\\[[sudo]($style)\\] ";
      cmd_duration.format = "\\[[$duration]($style)\\] ";
      format = lib.concatStrings [
        "$time"
        "$battery"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$package"
        "$rust"
        "$line_break"
        "$directory"
        "$line_break"
        "$status"
        "$sudo"
        "$jobs"
        "$cmd_duration"
        "$character"
      ];
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = { cat = "bat -s"; };
    bashrcExtra = lib.concatLines [
      "razer-cli --dpi 300"
      "razer-cli --poll 1000"
      # "razer-cli --battery 10"
    ];
  };

  home.stateVersion = "25.05";
}
