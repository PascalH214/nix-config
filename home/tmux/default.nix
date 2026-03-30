{
  pkgs,
  ...
}: let
in {
  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;
    prefix = "C-_";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha'
          set -g @catppuccin_window_text "#W"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"
        '';
      }
    ];
    extraConfig = ''
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      unbind C-l
      bind -n C-l select-pane -R

      bind ? split-window -h "exec tmux list-keys | less"

      set -g @plugin 'b0o/tmux-autoreload'

      set -g @plugin 'aserowy/tmux.nvim'
      set -g @tmux-nvim-navigation true
      set -g @tmux-nvim-navigation-cycle true
      set -g @tmux-nvim-navigation-keybinding-left 'C-h'
      set -g @tmux-nvim-navigation-keybinding-down 'C-j'
      set -g @tmux-nvim-navigation-keybinding-up 'C-k'
      set -g @tmux-nvim-navigation-keybinding-right 'C-l'
      # resize
      set -g @tmux-nvim-resize true
      set -g @tmux-nvim-resize-step-x 1
      set -g @tmux-nvim-resize-step-y 1
      set -g @tmux-nvim-resize-keybinding-left 'M-h'
      set -g @tmux-nvim-resize-keybinding-down 'M-j'
      set -g @tmux-nvim-resize-keybinding-up 'M-k'
      set -g @tmux-nvim-resize-keybinding-right 'M-l'

      if "test ! -d ~/.config/tmux/plugins/tpm" \
        "run 'git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && ~/.config/tmux/plugins/tpm/bin/install_plugins'"

      run '~/.config/tmux/plugins/tpm/tpm'
    '';
  };
}