{
  description = "Laptroll";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gaze.url = "github:GunduLabs/gaze";
  };

  outputs = inputs@{ nixpkgs, home-manager, gaze, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.laptroll = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./host/laptop/laptop.nix
        ./modules/temp.nix
          {nixpkgs.config.allowUnfree = true;}
        # gaze: imports the module and turns it on
        gaze.nixosModules.default
        { services.gaze.enable = true; }
  
        # your existing home-manager setup
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = import ./config/home.nix;
        }
      ];
    };
  };
}
