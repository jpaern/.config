{ lib, config, ... }:

let
  bg_color            = "#5f646f";
  inactive_bg_color   = "#2f343f";
  text_color          = "#f3f4f5";
  inactive_text_color = "#676e7d";
  urgent_bg_color     = "#e53935";
  separator_color     = "#757575";
  modifier = "Mod4";
  workspace1 = "1: Terminals";
  workspace2 = "2: Edit";
  workspace3 = "3: Browser ";
  workspace4 = "4: EMail";
  workspace5 = "5: Slack ";
  workspace7 = "7: Windows";
in 

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      colors = {
        focused = {
          border = bg_color;
          background = bg_color;
          text = text_color;
          indicator = "#2e9ef4";
          childBorder = bg_color;
        };
        focusedInactive = {
          border = inactive_bg_color;
          background = inactive_bg_color;
          text = inactive_text_color;
          indicator = "#484e50";
          childBorder = "#5f676a";
        };
        unfocused = {
          border = inactive_bg_color;
          background = inactive_bg_color;
          text = inactive_text_color;
          indicator = "#292d2e";
          childBorder = "#222222";
        };
        urgent = {
          border = urgent_bg_color;
          background = urgent_bg_color;
          text = text_color;
          indicator = "#900000";
          childBorder = "#900000";
        };
      };

      fonts = [ "Droid Sans Mono Slashed for Powerline 8" ];
      modifier = modifier;
      bars = [
        {
          position = "bottom";
          statusCommand = "/home/juri/dev/github/bumblebee-status/bumblebee-status -m cpu battery disk:home memory amixer date time -p interval=5 time.format=\"%H:%M\" date.format=\"%Y.%m.%d\" -t solarized-powerline";
          colors = {
            background = bg_color;
            separator = separator_color;
            focusedWorkspace = { border = bg_color; background = bg_color; text = text_color; };
            #activeWorkspace = { border = "#5f646f"; background = "#5f646f"; text = "#f3f4f5"; };
            inactiveWorkspace = { border = inactive_bg_color; background = inactive_bg_color; text = inactive_text_color; };
            urgentWorkspace = { border = urgent_bg_color; background = urgent_bg_color; text = text_color; };
          };
        }
      ];

      keybindings = lib.mkOptionDefault {
        "${modifier}+Shift+e" = "mode \"Exit (L)ogout, (R)eboot, (P)oweroff\"";
        "${modifier}+1" = "workspace ${workspace1}";
        "${modifier}+2" = "workspace ${workspace2}";
        "${modifier}+3" = "workspace ${workspace3}";
        "${modifier}+4" = "workspace ${workspace4}";
        "${modifier}+5" = "workspace ${workspace5}";
        "${modifier}+7" = "workspace ${workspace7}";

        # switch to workspace
        "${modifier}+Shift+1" = "move container to workspace ${workspace1}";
        "${modifier}+Shift+2" = "move container to workspace ${workspace2}";
        "${modifier}+Shift+3" = "move container to workspace ${workspace3}";
        "${modifier}+Shift+4" = "move container to workspace ${workspace4}";
        "${modifier}+Shift+5" = "move container to workspace ${workspace5}";
        "${modifier}+Shift+7" = "move container to workspace ${workspace7}";
      };
    };

    extraConfig =  ''
      bindsym Mod4+l exec i3lock-fancy

      # Sub floating windows are too big
      # floating_maximum_size 800 x 600
     
      mode "Exit (L)ogout, (R)eboot, (P)oweroff" {
          bindsym ${modifier}+r exec systemctl reboot
          bindsym ${modifier}+l exit
          bindsym ${modifier}+p exec systemctl poweroff

          # back to normal: Enter or Escape
          bindsym Return mode "default"
          bindsym Escape mode "default"
      }
    '';
  };
}

