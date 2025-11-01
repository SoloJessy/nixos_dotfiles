{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  inputs.homemanager = {
    url = "github:nix-community/home-manager/release-25.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs }@inputs:
  {
    nixosConfigurations.nixos-old = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPakages = true;
          home-manager.users.jessy = import ./home.nix;
        }
      ];
    };
  };
}
