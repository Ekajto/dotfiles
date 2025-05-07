
{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "q";
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."

      set-option -g status-position top

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind v split-window -v -c "#{pane_current_path}"
      bind b split-window -h -c "#{pane_current_path}"
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W "
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W "
          set -g status-right "#{E:@catppuccin_status_application} #{E:@catppuccin_status_session}"
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_directory}"
          set -ag status-right "#{E:@catppuccin_status_session}"
        '';
      }
    ];
  };
}
