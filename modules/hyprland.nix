{ config, lib, ... }:

let
  cfg = config.myWm;
  inherit (lib) mkIf;
in
{
  config = mkIf ( cfg.selection == "hyprland") {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # A display manager to launch the session
    services.xserver.enable = true;
    services.displayManager.ly.enable = true;
  };
}
