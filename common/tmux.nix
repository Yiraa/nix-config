{ config, lib, pkgs, modulesPath, inputs, outputs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "screen-256color";
    shortcut = "a";
    plugins = with pkgs.tmuxPlugins; [
      sessionist
    ];
    extraConfig = ''
      set -g mouse on
      set -s escape-time 0
      set -ag terminal-overrides ",xterm-256color:RGB"

      setw -g mode-keys vi

      # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      # clock mode
      setw -g clock-mode-colour yellow

      # copy mode
      setw -g mode-style 'fg=black bg=red bold'

      # panes
      set -g pane-border-style 'fg=red'
      set -g pane-active-border-style 'fg=yellow'

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'fg=red'

      #set -g status-left ''''
      set -g status-left-length 10

      set -g status-right-style 'fg=yellow'
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50

      setw -g window-status-current-style 'fg=black bg=red'
      setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=red bg=black'
      setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

      setw -g window-status-bell-style 'fg=yellow bg=red bold'

      # messages
      set -g message-style 'fg=yellow bg=red bold'

      set -g base-index 1

      # keybindings
      unbind-key C-v
      unbind-key C-f
      unbind-key C-a
      unbind-key C-z
      unbind-key C-e
      unbind-key C-r
      bind-key -r -n C-f run-shell "tmux neww tms"
      bind-key C-a select-window -t 1
      bind-key C-z select-window -t 2
      bind-key C-e select-window -t 3
      bind-key C-r select-window -t 4
    '';
  };
}
