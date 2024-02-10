{ config, pkgs, ... }:

{
  # Make an admin user
  users.users.garrett = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
    ];
  };

  # Set up some git defaults
  home-manager.users.garrett = {
    home.stateVersion = config.system.stateVersion;
    programs = {
      git = {
        enable = true;
        userName = "Garrett Myrick";
        userEmail = "garrettmyrick@gmail.com";
      };
    };
  };
}