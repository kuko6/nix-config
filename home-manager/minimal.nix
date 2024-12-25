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
    kitty
    # tofi

    # Fonts
    departure-mono
    fira-code
    fira-code-symbols
    fira-code-nerdfont
  ];

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
