
{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "q";
    mouse = true;
    terminal = "tmux-256color";
    baseIndex = 1;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."

      set -ag terminal-overrides ",xterm-256color:RGB"
      set-window-option -g mode-keys vi
      set-option -g status-position top

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key v split-window -v
      bind-key b split-window -h

      set -g @catppuccin_flavor 'mocha'
      set -g @catppuccin_window_status_style "rounded"
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W "
      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W "
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g status-right "#{E:@catppuccin_status_application} #{E:@catppuccin_status_session}"
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_directory}"
      set -ag status-right "#{E:@catppuccin_status_session}"
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      catppuccin 
    ];
  };
}
