{ pkgs, config, ... }: {
  enable = true;
  # shell = "${pkgs.zsh}/bin/zsh";
  plugins = with pkgs.tmuxPlugins; [ sensible ];

  extraConfig = ''
    set-option -sg default-terminal "tmux-256color"
    set -as terminal-features ",xterm-256color:RGB"

    # Enables mouse
    set -g mouse on

    # Fix numbering
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    # Open in cwd
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"

    # Theme #
    # source-file ~/.config/tmux/themes/catppuccin_mocha_tmux.conf
    # Catppuccin (Mocha) color scheme
    set -ogq @thm_bg "#1e1e2e"
    set -ogq @thm_fg "#cdd6f4"

    # colors
    set -ogq @thm_rosewater "#f5e0dc"
    set -ogq @thm_flamingo "#f2cdcd"
    set -ogq @thm_rosewater "#f5e0dc"
    set -ogq @thm_pink "#f5c2e7"
    set -ogq @thm_mauve "#cba6f7"
    set -ogq @thm_red "#f38ba8"
    set -ogq @thm_maroon "#eba0ac"
    set -ogq @thm_peach "#fab387"
    set -ogq @thm_yellow "#f9e2af"
    set -ogq @thm_green "#a6e3a1"
    set -ogq @thm_teal "#94e2d5"
    set -ogq @thm_sky "#89dceb"
    set -ogq @thm_sapphire "#74c7ec"
    set -ogq @thm_blue "#89b4fa"
    set -ogq @thm_lavender "#b4befe"

    # surfaces and overlays
    set -ogq @thm_subtext_1 "#a6adc8"
    set -ogq @thm_subtext_0 "#bac2de"
    set -ogq @thm_overlay_2 "#9399b2"
    set -ogq @thm_overlay_1 "#7f849c"
    set -ogq @thm_overlay_0 "#6c7086"
    set -ogq @thm_surface_2 "#585b70"
    set -ogq @thm_surface_1 "#45475a"
    set -ogq @thm_surface_0 "#313244"
    set -ogq @thm_mantle "#181825"
    set -ogq @thm_crust "#11111b"
    
    # status left look and feel
    set -g status-left-length 100
    set -g status-left ""
    set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0},none]│"
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_maroon}]  #{pane_current_command} "
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0},none]│"
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0},none]│"
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"
    set -ga status-left "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"

    # status right look and feel
    set -g status-right-length 100
    set -g status-right ""
    set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_green}]  #{user}@#{host}"
    set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0},none]│"
    set -ga status-right "#[bg=#{@thm_mantle},fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "

    # Configure Tmux
    set -g status-position bottom
    set -g status-style "bg=#{@thm_mantle}"
    set -g status-justify "left"

    # pane border look and feel
    # setw -g pane-border-status bottom
    setw -g pane-border-status off
    setw -g pane-border-format ""
    setw -g pane-border-style "fg=#{@thm_surface_0}"
    # set -g pane-active-border-style
    setw -g pane-border-lines single

    # window look and feel
    set -wg automatic-rename on
    set -g automatic-rename-format "Window"

    set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
    set -g window-status-style "fg=#{@thm_peach}"
    # set -g window-status-last-style "fg=#{@thm_peach}"
    set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
    set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
    set -gF window-status-separator "#[bg=#{@thm_mantle},fg=#{@thm_overlay_0}]"

    set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
    set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"

    set -g menu-style "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]"
    set -g message-style "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]"
    setw -g mode-style 'bg=#{@thm_surface_2}'

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    # bootstrap tpm
    if "test ! -d ~/.tmux/plugins/tpm" \
       "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

    run '~/.tmux/plugins/tpm/tpm'
  '';
}
