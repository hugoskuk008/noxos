{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.wm-hyprland;
  inherit (lib) mkEnableOption mkIf mkDefault;
in
{
  options.profiles.wm-hyprland.enable =
    mkEnableOption "Hyprland window manager";

  config = mkIf cfg.enable {
    myWm.selection = "hyprland";

    user-base.terminal = mkDefault {
      package = pkgs.kitty;
      command = "kitty";
    };
    user-base.launcher = mkDefault {
      package = pkgs.rofi;
      command = "rofi --show drun";
    };
  };
}
