# See https://fictionbecomesfact.com/nixos-cockpit-machines

{ pkgs, ... }:

{
  virtual-machines = pkgs.callPackage ./virtual-machines.nix { };
  libvirt-dbus = pkgs.callPackage ./libvirt-dbus.nix {};
  # podman-containers = pkgs.callPackage ./podman-containers.nix { };
}