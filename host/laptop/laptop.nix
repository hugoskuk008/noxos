{config, lib, pkgs, ...}:

{
 imports = [
#BORDE INTE RÖRAS
./hardware-configuration.nix
./specialisations.nix

 ];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;

networking.networkmanager.enable = true;

 time.timeZone = "Europe/Stockholm";
  
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  font = "Lat2-Terminus16";
  useXkbConfig = true; # use xkb.options in tty.
   };

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };


	nix.settings.experimental-features = ["nix-command" "flakes" ];

}
