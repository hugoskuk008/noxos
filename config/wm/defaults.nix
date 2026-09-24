{ lib, pkgs, ... }:

{
  user-base.cursor = {
    name    = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size    = 24;
  };
}
