{ config, pkgs, ... }:

{
  imports = [
    ../../default.nix
  ];

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
