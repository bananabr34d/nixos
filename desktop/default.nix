{ config, pkgs, ... }:

{
  imports = [ ./dconf.nix ./gnome.nix ./gtk.nix ./wayland.nix ./x11.nix ];
}
