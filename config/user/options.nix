{ lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.user-base = {
    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
      description = ''
        Packages installed regardless of window manager.
        Additions from other modules merge in; use lib.mkForce to replace.
      '';
    };

    terminal = mkOption {
      type = types.submodule {
        options = {
          package = mkOption { type = types.package; };
          command = mkOption { type = types.str; };
        };
      };
      default = { package = pkgs.kitty; command = "kitty"; };
    };

    launcher = mkOption {
      type = types.submodule {
        options = {
          package = mkOption { type = types.package; };
          command = mkOption { type = types.str; };
        };
      };
      default = { package = pkgs.rofi; command = "rofi --show drun"; };
    };

    cursor = mkOption {
      type = types.submodule {
        options = {
          name    = mkOption { type = types.str; };
          package = mkOption { type = types.package; };
          size    = mkOption { type = types.int; default = 24; };
        };
      };
      default = {
        name    = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size    = 24;
      };
    };
  };
}
