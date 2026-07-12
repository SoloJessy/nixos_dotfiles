{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      fenix,
      nixos-hardware,
      stylix,
      agenix,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          agenix.nixosModules.default
          stylix.nixosModules.stylix
          nixos-hardware.nixosModules.framework-16-amd-ai-300-series
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "BAK";
            home-manager.users.jessy = import ./home.nix;
          }
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ fenix.overlays.default ];
              environment.systemPackages = [
                (pkgs.fenix.complete.withComponents [
                  "cargo"
                  "clippy"
                  "rust-src"
                  "rustc"
                  "rustfmt"
                  "rust-docs"
                ])
                pkgs.rust-analyzer-nightly
                pkgs.gcc
                pkgs.cargo-audit
                pkgs.cargo-generate
                pkgs.watchexec
                # pkgs.tuxedo
              ];
            }
          )
        ];
      };
    };
}
