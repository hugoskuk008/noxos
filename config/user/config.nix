{ config, pkgs, ... }:

let
  cfg = config.user-base;
in
{
  # Normal-priority base list: additions merge (concatenate),
  # mkForce from overrides.nix replaces the whole thing.
  user-base.packages = with pkgs; [
    ripgrep fd jq git neovim firefox
    nerd-fonts.jetbrains-mono
  ];

  home.packages = cfg.packages ++ [
    cfg.terminal.package
    cfg.launcher.package
    cfg.cursor.package
  ];

  home.sessionVariables = {
    EDITOR        = "nvim";
    BROWSER       = "firefox";
    XCURSOR_THEME = cfg.cursor.name;
    XCURSOR_SIZE  = toString cfg.cursor.size;
  };

  programs.git = {
    enable = true;
    userName  = "you";
    userEmail = "you@example.com";
  };

  programs.fish.enable = true;
  programs.starship.enable = true;

  gtk = {
    enable = true;
    cursorTheme = {
      name    = cfg.cursor.name;
      package = cfg.cursor.package;
      size    = cfg.cursor.size;
    };
  };
}
