{ lib, pkgs, ... }:

let
  inherit (lib) mkForce;
in
{
  # Additions (normal priority → merge with the base)
  # user-base.packages        = [ pkgs.discord ];
  # myWm.hyprland.packages = [ pkgs.spotify ];
  # myWm.gnome.packages    = [ pkgs.obsidian ];

  # Replace a base list entirely
  # myBase.packages = mkForce (with pkgs; [ ripgrep fd jq ]);

  # Field-level bar override — base uses mkDefault, so this just wins
  # myWm.hyprland.bar.package = pkgs.hyprpanel;

  # Full bar swap — all three fields at normal priority filter out the mkDefault base
  # myWm.hyprland.bar = {
  #   package    = pkgs.ags;
  #   configFile = ./ags/config.js;
  #   launch     = "ags run";
  # };

  # Last resort: force a setting the WM branch hardcodes
  # wayland.windowManager.hyprland.settings."exec-once" =
  #   mkForce [ "ags run" ];
}
