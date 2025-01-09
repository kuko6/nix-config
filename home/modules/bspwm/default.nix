{ config, pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
  };

  home.packages = with pkgs; [
    kitty
    sxhkd
    polybar
    rofi
    feh
  ];
}
