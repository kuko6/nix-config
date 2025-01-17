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

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Catppuccin-Latte-Compact-Pink-Light";
  #     package = pkgs.catppuccin-gtk.override {
  #       accents = [ "pink" ];
  #       size = "compact";
  #       tweaks = [ "normal" ];
  #       variant = "latte";
  #     };
  #   };
  #   iconTheme = {
  #     name = "Papirus";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   cursorTheme = {
  #     name = "Vanilla-DMZ";
  #     package = pkgs.vanilla-dmz;
  #     size = 16;
  #   };
  # };

  # Creates common user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    templates = null;
    publicShare = null;
    extraConfig = {
      XDG_DEVELOPER_DIR = "${config.home.homeDirectory}/Developer";
    };
  };

  # Packages installed to the user profile
  # packages doesnt need to be here if they are included in programs
  home.packages = with pkgs; [
    starship
    fastfetch
    yazi
    tmux
    helix
    btop
    firefox
    nautilus
    qimgv
    # ghostty

    # Fonts
    departure-mono
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];

  # services.snapd.enable = false;

  programs.git = {
    enable = true;
    userName = "Jakub Povinec";
    userEmail = "jakub.povinec@gmail.com";
    extraConfig = { init = { defaultBranch = "main"; }; };
  };

  programs = {
    zsh = import ./modules/zsh.nix { inherit config pkgs; };
  };

  programs.home-manager.enable = true;
}
