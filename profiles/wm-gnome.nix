{ config, lib, pkgs, ... }:

let
  cfg = config.profiles.wm-gnome;
  inherit (lib) mkEnableOption mkIf mkDefault;
in
{
  options.profiles.wm-gnome.enable =
    mkEnableOption "GNOME desktop";

  config = mkIf cfg.enable {
    myWm.selection = "gnome";

    user-base.terminal = mkDefault {
      package = pkgs.gnome-terminal;
      command = "gnome-terminal";
    };
    user-base.launcher = mkDefault {
      package = pkgs.gnome-shell;
      command = "gnome-shell --replace";
    };
  };
}
