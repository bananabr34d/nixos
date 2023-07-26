{
  description = "Nix0S Flake File";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixos-generators, agenix, ... } @ inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";
    stateVersion = "23.05";
    libx = import ./lib { inherit inputs outputs stateVersion; };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos/configuration.nix
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.joe = ./home-manager/home.nix;
            };
          }
        ];
      };
      oxygen = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/oxygen/configuration.nix
          nixos-hardware.nixosModules.dell-xps-13-9350
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.joe = ./home-manager/home.nix;
            };
          }
        ];
      };
    };
    devShells = libx.forAllSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in import ./shell.nix { inherit pkgs; }
    );
  };
}
