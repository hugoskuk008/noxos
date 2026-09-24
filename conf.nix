{ config, lib, ... }:

let
  inherit (lib) mkMerge;
in
{
  imports = [
    ./shared/options.nix
    ./profiles
    ./selection.nix
    ./modules/automatic-updates.nix
    ./modules/garbage-clean.nix
    ./modules/local-nfs.nix
    ./modules/gnome.nix
    ./modules/hyprland.nix
  ];


  # Wire Home Manager in. It needs the same shared/options + profiles + selection.
  home-manager.users.admin = {
    imports = [
      ./shared/options.nix
      ./profiles
      ./selection.nix
      ./config/home.nix
    ];
  };

  # Exactly one WM profile
  assertions = [{
    assertion = builtins.length (builtins.filter (x: x) [
      config.profiles.wm-hyprland.enable
      config.profiles.wm-gnome.enable
      config.profiles.wm-none.enable
    ]) == 1;
    message = "Enable exactly one of profiles.wm-{hyprland,gnome,none}.enable";
  }];


# conf.nix

  users.users.admin = {
    isNormalUser = true;
    home = "/home/admin";
    extraGroups = [ "wheel" "networkmanager" ];   # adjust as needed
  };


}
