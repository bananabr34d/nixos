{ config, pkgs, ... }:

{
  imports = [ ./gnome.nix ./gtk.nix ./wayland.nix ./x11.nix ];
}
