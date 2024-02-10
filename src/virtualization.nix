{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu_kvm
    libvirt
    # libosinfo
    # osinfo-db
    # osinfo-db-tools
    virt-manager
  ];

  virtualisation.libvirtd = {
    enable = true;
    # extraConfig = ''
    #   unix_sock_rw_perms = "0777"
    # '';
  };
}