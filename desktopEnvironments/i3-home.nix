{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "mod4";
      terminal = "alacritty";
      menu = "${pkgs.dmenu}/bin/dmenu_run -nf \"#bbbbbb\" -nb \"#222222\" -sb \"#613583\" -sf \"#eeeeee\" -fn \"monospace:size=10\" -p \"dmenu\"";
      defaultWorkspace = "1";
      focus = {
        followMouse = false;
        mouseWarping = true;
      };
      startup =
        let
          wallpaper = "~/Pictures/cosmic/A_stormy_stellar_nursery_esa_379309.jpg";
        in
        [
          {
            always = true;
            command = "i3a-master-stack --stack=i3";
          }
          {
            always = true;
            command = "bluemon-tray";
          }
          {
            always = true;
            command = "feh --bg-scale ${wallpaper}";
          }
        ];
      assigns = {
        "9: games" = [ { class = "(?i)steam"; } ];
      };

      keybindings =
        let
          mod = config.xsession.windowManager.i3.config.modifier;
          term = config.xsession.windowManager.i3.config.terminal;
          menu = config.xsession.windowManager.i3.config.menu;
          browser = "firefox";
        in
        {
          # Workspaces
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          # Window Management
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+Up" = "exec i3a-resize-compass up 20px";
          "${mod}+Down" = "exec i3a-resize-compass down 20px";
          "${mod}+Right" = "exec i3a-resize-compass right 20px";
          "${mod}+Left" = "exec i3a-resize-compass left 20px";

          # i3 commands
          "${mod}+q" = "kill";
          "${mod}+Shift+r" = "restart";
          # exec
          "${mod}+Return" = "exec ${term}";
          "${mod}+p" = "exec ${menu}";
          "${mod}+b" = "exec ${browser}";
        };

      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          mode = "dock";
          position = "top";
          fonts = {
            names = [ "DroidSansM Nerd Font" ];
            style = "Normal Semi-Condensed";
            size = 8.0;
          };
          colors = {
            background = "#241f31";
            statusline = "#ffffff";
            separator = "#666666";
            focusedWorkspace = {
              border = "#813d9c";
              background = "#613583";
              text = "#ffffff";
            };
            activeWorkspace = {
              border = "#333333";
              background = "#222222";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              border = "#333333";
              background = "#222222";
              text = "#888888";
            };
            urgentWorkspace = {
              border = "#2f343a";
              background = "#900000";
              text = "#ffffff";
            };
            bindingMode = {
              border = "#2f343a";
              background = "#900000";
              text = "#ffffff";
            };
          };
        }
      ];
      colors = {
        focused = {
          border = "#813d9c";
          background = "#613583";
          text = "#ffffff";
          indicator = "#813d9c";
          childBorder = "#613583";
        };
        focusedInactive = {
          border = "#333333";
          background = "#222222";
          text = "#888888";
          indicator = "#292d2e";
          childBorder = "#222222";
        };
        unfocused = {
          border = "#333333";
          background = "#222222";
          text = "#888888";
          indicator = "#292d2e";
          childBorder = "#222222";
        };
        urgent = {
          border = "#2f343a";
          background = "#900000";
          text = "#ffffff";
          indicator = "#900000";
          childBorder = "#900000";
        };
        placeholder = {
          border = "#000000";
          background = "#0c0c0c";
          text = "#ffffff";
          indicator = "#000000";
          childBorder = "#0c0c0c";
        };
        background = "#ffffff";
      };
    };
  };
  programs.i3status-rust = {
    enable = true;
    bars.top = {

      icons = "material-nf";
      settings = {
        theme = {
          theme = "plain";
          overrides = {
            idle_bg = "#241f31";
            info_bg = "#241f31";
            good_bg = "#241f31";
            warning_bg = "#241f31";
            critical_bg = "#241f31";
            separator_bg = "#241f31";
          };
        };
      };
      blocks = [
        {
          block = "time";
        }
        {
          block = "cpu";
        }
        {
          block = "temperature";
        }
        {
          block = "memory";
        }
        {
          block = "net";
        }
        {
          block = "battery";
          format = " $icon $percentage $time_remaining ";
          full_format = " $icon $percentage ";
          charging_format = " $icon $percentage ";
        }
      ];
    };
  };
  home.file = {
    cosmic-wallpapers = {
      source = "${pkgs.cosmic-wallpapers}/share/backgrounds/cosmic/";
      target = "Pictures/cosmic/";
      recursive = false;
    };
  };

}
