{ config, lib, pkgs, ... }:

let
  cfg = config.myWm;
  inherit (lib) mkIf mkDefault;
in
{
  config = mkIf (cfg.selection == "gnome") {
    services.xserver.enable = true;

    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    # GNOME is opinionated; these are the usual quality-of-life tweaks
    services.gnome.games.enable = mkDefault false;

    # Extensions you want available system-wide
    environment.systemPackages = with pkgs; [
      gnomeExtensions.appindicator
    ];

  };
}
