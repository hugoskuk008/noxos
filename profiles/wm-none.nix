{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.wm-none;
  inherit (lib) mkEnableOption mkIf mkDefault;
in
{
  options.profiles.wm-none.enable =
    mkEnableOption "no window manager (tty only)";

  config = mkIf cfg.enable {
    myWm.selection = "none";
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
