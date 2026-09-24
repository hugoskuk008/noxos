{ lib, ... }:

let
  inherit (lib) mkOption mkEnableOption types;
in
{
  options.myWm = {
    enable = mkEnableOption "window manager selection";

    selection = mkOption {
      type = types.enum [ "none" "gnome" "hyprland" ];
      default = "none";
      description = "Which window manager to enable for this host.";
    };

    gnome = {
      enableGaze = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Gaze face authentication for GNOME.";
      };
      packages = mkOption {
        type = types.listOf types.package;
        default = [ ];
        description = "Additions on top of the GNOME base package set.";
      };
    };

    hyprland = {
      packages = mkOption {
        type = types.listOf types.package;
        default = [ ];
        description = "Additions on top of the Hyprland base package set.";
      };

      bar = mkOption {
        type = types.submodule {
          options = {
            package    = mkOption { type = types.package; };
            configFile = mkOption { type = types.nullOr types.path; default = null; };
            launch     = mkOption { type = types.nullOr types.str;  default = null; };
          };
        };
        default = { };
        description = ''
          Hyprland status bar. Field-level overrides from any module win
          because the base in wm/hyprland.nix uses lib.mkDefault.
        '';
      };
    };
  };
}
