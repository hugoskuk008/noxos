{config, lib, pkgs, ...}:

{



  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "admin" ];
  };
 
   #Enable the X11 windowing system.
#  services.xserver.enable = true;
#services.xserver = {
#  enable = true;
#  autoRepeatDelay = 200;
#  autoRepeatInterval = 35;



#};

  services.displayManager.ly.enable = true;
services.xserver.desktopManager.xfce.enable = true;
   services.xserver.xkb.layout = "se";
#
services.power-profiles-daemon.enable = false;
services.xrdp = {
  enable = true;
  defaultWindowManager = "startxfce4";
  openFirewall = true;
};



services.xrdp.audio.enable = true;




   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

   services.libinput.enable = true;
   users.users.admin = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

   programs.firefox.enable = true;

   environment.systemPackages = with pkgs; [
     vim 
     git
     alacritty
     wget
     btop
   ];
	fonts.packages = with pkgs; [
nerd-fonts.jetbrains-mono
];
	nix.settings.experimental-features = ["nix-command" "flakes" ];
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 ];
   networking.firewall.allowedUDPPorts = [  ];
   networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = false;

  system.stateVersion = "26.05"; # Did you read the comment?



}
