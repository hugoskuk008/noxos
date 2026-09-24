{ config, lib, pkgs, ... }:

let
  cfg  = config.myWm;
  base = config.user-base;
  inherit (lib) mkIf mkDefault optionals optionalAttrs;
in
{
  config = mkIf (cfg.selection == "hyprland") {
    myWm.hyprland.packages = with pkgs; [
      waybar 
      rofi 
      hyprpaper
    ];

    myWm.hyprland.bar = mkDefault {
      package    = pkgs.waybar;
      configFile = ./waybar-config.jsonc;
      launch     = "waybar";
    };

    home.packages = cfg.hyprland.packages ++ [ cfg.hyprland.bar.package ];

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod"      = "SUPER";
        "exec-once" = optionals (cfg.hyprland.bar.launch != null)
                        [ cfg.hyprland.bar.launch ];
        bind = [
          "$mod, Return, exec, ${base.terminal.command}"
          "$mod, D, exec, ${base.launcher.command}"
        ];
      };
    };

    xdg.configFile = optionalAttrs (cfg.hyprland.bar.configFile != null) {
      "waybar/config".source = cfg.hyprland.bar.configFile;
    };

    home.sessionVariables = {
      HYPRCURSOR_THEME = base.cursor.name;
      HYPRCURSOR_SIZE  = toString base.cursor.size;
    };
  };
}
