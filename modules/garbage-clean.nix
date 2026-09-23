{ config, lib, ... }:

{
  options.garbage-clean.enable = lib.mkEnableOption "Enable automatic GC";

  config = lib.mkIf config.garbage-clean.enable {
    services.nix-daemon.automaticGC = {
      enable = true;
      days = 3; 
    };
  };
}

