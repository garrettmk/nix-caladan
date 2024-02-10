{ inputs, pkgs, ... }:

{
  system.stateVersion = "23.11";
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  
  environment.systemPackages = with pkgs; [
    nano
    wget
    git
    dbus
    glib
    tree
    (python3.withPackages (ps: with ps; [
      pygobject3
    ]))
    libosinfo
    osinfo-db
    osinfo-db-tools
    gobject-introspection
  ];

  services.openssh = {
    enable = true;
  };

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./home-manager.nix
    ./users.nix
    ./vscode-server.nix
    ./virtualization.nix
    ./cockpit.nix
  ];
}