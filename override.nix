{ lib, pkgs, ... }:

let inherit (lib) mkForce;
in {
  # myWm.selection = mkForce "gnome";   # bypass profiles
  # myUser.packages = mkForce (with pkgs; [ ripgrep fd ]);

services.openssh.enable = true;
}
