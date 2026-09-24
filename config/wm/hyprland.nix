{ config, lib, pkgs, ... }:

let
  cfg  = config.myWm;
  base = config.user-base;

  inherit (lib) mkIf mkDefault;
in
{
  config = mkIf (cfg.selection == "hyprland") {
    myWm.hyprland.hyprland = {
      hypr-packages = with pkgs; [
        waybar
        rofi
        awww
        waypaper
      ];

      configFile = ./hyprland/hyprland/hypr;
    };

    myWm.hyprland.bar = mkDefault {
      package    = pkgs.waybar;
      configFile = ./hyprland/waybar;
      launch     = "waybar";
    };

    home.packages =
      cfg.hyprland.hyprland.hypr-packages
      ++ [ cfg.hyprland.bar.package ];

    wayland.windowManager.hyprland = {
      enable = false;
      systemd.enable = false;
    };

    xdg.configFile = {
      "hypr".source = cfg.hyprland.hyprland.configFile;
      "waybar".source = cfg.hyprland.bar.configFile;
    };

    home.sessionVariables = {
      HYPRCURSOR_THEME = base.cursor.name;
      HYPRCURSOR_SIZE  = toString base.cursor.size;
    };
  };
}
