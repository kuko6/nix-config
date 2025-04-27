{ config, pkgs, ... }:

{
  imports = [
    ../../default.nix
  ];

  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    sxhkd
    polybar
    rofi
    feh

    gnome-extension-manager
    gnome-weather
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.places-status-indicator
    gnomeExtensions.user-themes
    gnomeExtensions.open-bar
    gnomeExtensions.space-bar
    gnomeExtensions.runcat
  ];

  xsession.windowManager.bspwm = {
    enable = true;
  };

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
}
