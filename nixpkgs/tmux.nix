{
  programs.tmux = {
    baseIndex = 0;
    clock24   = true;
    enable    = true;
    keyMode   = "vi";
    shortcut  = "a";
    terminal  = "screen-256color";
    extraConfig = ''
      set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
      setw -q -g utf8 on
      set -g pane-active-border-style fg=colour1

      #Set the left and right status
      set -g status-left '#[bg=colour7]#[fg=colour0]#{?client_prefix,#[bg=colour2],} ❐ #S #[bg=colour0]#[fg=colour7]#{?client_prefix,#[fg=colour2],}#{?window_zoomed_flag, 🔍 ,}#[fg=colour1] '
      set -g status-right ' #[bg=colour0]#[fg=colour1]#[bg=colour1]#[fg=colour0] %b %d %H:%M '

      # Set the background color
      set -g status-bg colour0

      # customize how windows are displayed in the status line
      set -g window-status-current-format "#[fg=colour0]#[bg=colour4]#[fg=colour7]#[bg=colour4]#[fg=colour7] #I* #W #[fg=colour4]#[bg=colour0]"
      set -g window-status-format "#[fg=colour244]#[bg=colour0]#[fg=colour240]  #I - #W"
    '';
  };
}
