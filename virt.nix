{ pkgs, ... }: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirtd.members = [ "jessy" ];
  users.groups.kvm.members = [ "jessy" ];

  environment.systemPackages = with pkgs; [ gnome-boxes dnsmasq ];
}
