{ config, pkgs, ... }:

{
  home.username = "kuko";
  home.homeDirectory = "/home/kuko";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

  home.file = {
    "${config.xdg.configHome}" = {
      source = ../dotfiles;
      recursive = true;
    };
  };

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    # will be in ~/.config/xdg-desktop-portals/
    portal = {
      config = {
        common.default = "gtk";
        river.default = ["wlr" "gtk"];
      };
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
      enable = true;
    };
  };

  wayland.windowManager.river = {
    enable=true;
  };

  # Packages installed to the user profile
  # packages doesnt need to be here if they are included in programs
  home.packages = with pkgs; [
    neofetch
    bat
    starship
    ghostty
    waybar
    foot
    fuzzel
    swaybg

    # Fonts
    departure-mono
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];

  # services.snapd.enable = false;

  # home.sessionVariables = {
  #   XDG_CURRENT_DESKTOP = "river";
  #   XDG_SESSION_TYPE = "wayland";
  #   GTK_USE_PORTAL = 1;
  #   GDK_BACKEND = "wayland";
  # };

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
