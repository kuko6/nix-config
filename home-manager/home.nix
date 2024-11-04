{ config, pkgs, ... }:

{
  home.username = "kuko";
  home.homeDirectory = "/home/kuko";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

  # Packages installed to the user profile 
  # packages doesnt need to be here if they are included in programs
  home.packages = with pkgs; [
    neofetch
    bat

    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
  ];

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      search = [ "<Super>S" ];
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
    zsh = import ./zsh.nix { inherit config pkgs; };
    helix = import ./helix.nix { inherit config pkgs; };
  };

  programs.home-manager.enable = true;
}
