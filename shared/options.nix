{ lib, ... }:

let
  inherit (lib) mkOption mkEnableOption types;
in
{
  options.myWm = {
    selection = mkOption {
      type = types.enum [ "none" "gnome" "hyprland" ];
      default = "none";
      description = "Which window manager this host runs. Set via profiles.";
    };

    gnome.enableGaze = mkOption {
      type = types.bool;
      default = false;
    };

  hyprland = {
  hyprland = mkOption {
    type = types.submodule {
      options = {
        hypr-packages = mkOption {
          type = types.listOf types.package;
          default = [ ];
        };

        configFile = mkOption {
          type = types.nullOr types.path;
          default = null;
        };
      };
    };

    default = { };
  };

  bar = mkOption {
    type = types.submodule {
      options = {
        package = mkOption {
          type = types.package;
        };

        configFile = mkOption {
          type = types.nullOr types.path;
          default = null;
        };

        launch = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
      };
    };

    default = { };
  };
};
    gnome.packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  options.user-base = {
    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };

    terminal = mkOption {
      type = types.submodule {
        options = {
          package = mkOption { type = types.package; };
          command = mkOption { type = types.str; };
        };
      };
      description = "Set per window manager in profiles/wm-*.nix.";
    };

    launcher = mkOption {
      type = types.submodule {
        options = {
          package = mkOption { type = types.package; };
          command = mkOption { type = types.str; };
        };
      };
      description = "Set per window manager in profiles/wm-*.nix.";
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
        package = null;   # set in platform-specific config
        size    = 24;
      };
    };
  };
}
