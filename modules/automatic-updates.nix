{config, lib, pkgs, ...}:

{

options = {
 automatic-updates.enable = lib.mkEnableOption "Enable automatic system updates";};

  config = lib.mkIf config.automatic-updates.enable {

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    randomizedDelaySec = "45min";
    allowReboot = false;
  };


  };



















}
