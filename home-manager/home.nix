{ config, pkgs, ... }:

{
  home.username = "kuko";
  home.homeDirectory = "/home/kuko";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

  fonts.fontconfig.enable = true;

  # Packages installed to the user profile
  # packages doesnt need to be here if they are included in programs
  home.packages = with pkgs; [
    neofetch
    bat
    starship
    # zed-editor
    # ulauncher
    # tofi

    # Fonts
    departure-mono
    fira-code
    fira-code-symbols
    fira-code-nerdfont

    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.places-status-indicator
    gnomeExtensions.user-themes
    gnomeExtensions.open-bar
    gnomeExtensions.space-bar
    gnomeExtensions.runcat
  ];

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      # search = [ "<Super>S" ];
      close = [ "<Super>Q" ];
      switch-to-workspace-left = [ "<Control>Left" ];
      switch-to-workspace-right = [ "<Control>Right" ];
      move-to-workspace-left = [ "<Control><Shift>Left" ];
      move-to-workspace-right = [ "<Control><Shift>Right" ];
    };
  };

  programs.git = {
    enable = true;
    userName = "Jakub Povinec";
    userEmail = "jakub.povinec@gmail.com";
    extraConfig = { init = { defaultBranch = "main"; }; };
  };

  programs = {
    zsh = import ./modules/zsh.nix { inherit config pkgs; };
    helix = import ./modules/helix.nix { inherit config pkgs; };
    tmux = import ./modules/tmux.nix { inherit config pkgs; };
  };

  programs.home-manager.enable = true;
}
