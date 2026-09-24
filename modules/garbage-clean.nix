{ config, lib, ... }:

let
  cfg = config.garbageClean;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.garbageClean.enable =
    mkEnableOption "automatic Nix garbage collection";

  config = mkIf cfg.enable {
    nix.gc = {
      automatic = true;
      dates     = "daily";              # systemd calendar spec, e.g. "daily", "weekly", "*-*-* 03:00:00"
      options   = "--delete-older-than 3d";
    };

    nix.settings.auto-optimise-store = true;
  };
}

