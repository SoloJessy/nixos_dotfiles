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
          mode = "dock";
          position = "top";
          colors = {
            background = "#241f31";
            statusLine = "#ffffff";
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
}
