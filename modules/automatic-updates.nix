{ config, lib, ... }:

let
  cfg = config.automaticUpdates;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.automaticUpdates.enable =
    mkEnableOption "automatic system updates";

  config = mkIf cfg.enable {
    system.autoUpgrade = {
      enable             = true;
      dates              = "weekly";
      randomizedDelaySec = "45min";
      allowReboot        = false;
    };
  };
}
