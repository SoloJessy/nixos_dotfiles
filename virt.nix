{ pkgs, ... }:
{

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "jessy" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

}
