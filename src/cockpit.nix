{ config, pkgs, ... }:

let
  cockpit-apps = pkgs.callPackage cockpit-apps/default.nix { inherit pkgs; };
in {
  environment.systemPackages = with pkgs; [
    cockpit
    cockpit-apps.libvirt-dbus
    cockpit-apps.virtual-machines
  ];

  services.cockpit = {
    enable = true;
    openFirewall = true;
  };
}