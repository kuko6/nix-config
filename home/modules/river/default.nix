{ config, pkgs, ... }:

{
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

  home.packages = with pkgs; [
    waybar
    foot
    fuzzel
    swaybg
  ];

  # home.sessionVariables = {
  #   XDG_CURRENT_DESKTOP = "river";
  #   XDG_SESSION_TYPE = "wayland";
  #   GTK_USE_PORTAL = 1;
  #   GDK_BACKEND = "wayland";
  # };
}
