{ config, pkgs, ...}:

 {
	home.username = "admin";
	home.homeDirectory = "/home/admin";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.bash = {
	enable = true;
	shellAliases = {
	 btw = "echo I use nixos,btw";
     };
   };

   home.pointerCursor = {
  gtk.enable = true;
  x11.enable = true;
  package = pkgs.bibata-cursors; # Replace with your preferred cursor package
  name = "Bibata-Modern-Ice";     # Exact name inside the package
  size = 24;                     # Desired cursor size
};

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
