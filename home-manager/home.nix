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
    # helix
    # git
    # zsh
  ];

  programs.home-manager.enable = true;
  programs = {
    zsh = import ./zsh.nix {inherit config pkgs;};
    git = import ./git.nix {inherit config pkgs;};
    helix = import ./helix.nix {inherit config pkgs;};
  };
}
