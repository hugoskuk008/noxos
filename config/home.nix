{ config, pkgs, ...}:

 {
  imports = [
   ./user.nix
   ./wm.nix
   ./overrides.nix
   ];

	home.username = "admin";
	home.homeDirectory = "/home/admin";
	programs.git.enable = true;
	home.stateVersion = "26.05";




 }
