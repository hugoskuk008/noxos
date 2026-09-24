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

home.file.".config/nvim".source = ./nvim;


home.packages = with pkgs; [
tuned
neovim
ripgrep
nil
nixpkgs-fmt
nodejs
gcc
vesktop
localsend 
thunderbird
steam
vlc
powertop
];

 }
