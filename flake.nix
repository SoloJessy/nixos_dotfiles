{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-mineral.url = "github:cynicsketch/nix-mineral/";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      fenix,
      nixos-hardware,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.framework-16-amd-ai-300-series
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
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
              ];
            }
          )
        ];
      };
    };
}
