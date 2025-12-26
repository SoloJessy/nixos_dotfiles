{ pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "mod4";
      terminal = "alacritty";
      menu = "${pkgs.dmenu}/bin/dmenu_run -nf \"#bbbbbb\" -nb \"#222222\" -sb \"#613583\" -sf \"#eeeeee\" -fn \"monospace:size=10\" -p \"dmenu\"";
      focus = {
        followMouse = true;
        mouseWarping = true;
      };
      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          mode = "dock";
          position = "top";
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
          background = "#c5f676a";
          text = "#ffffff";
          indicator = "#484e50";
          childBorder = "#5f676a";
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
    bars.top.settings = {
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
    bars.top.blocks = [
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
}
