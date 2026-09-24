{ config, lib, pkgs, ... }:

let
  cfg  = config.myWm;
  base = config.user-base;
  inherit (lib) mkIf optionals;
in
{
  config = mkIf (cfg.selection == "gnome") {
    myWm.gnome.packages = with pkgs; [
      gnome-tweaks
      gnomeExtensions.appindicator
    ] ++ optionals cfg.gnome.enableGaze [
    ];

    home.packages = cfg.gnome.packages;

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        cursor-theme = base.cursor.name;
        cursor-size  = base.cursor.size;
      };
    };

    xdg.mimeApps.defaultApplications = {
      "x-scheme-handler/http"  = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };
}
