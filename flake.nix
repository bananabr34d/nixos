{
  description = "Nix0S Flake File";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astronvim = {
      url = "github:AstroNvim/AstroNvim/v3.35.0";
      flake = false;
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur, nixos-hardware, nixos-generators, agenix, ... } @ inputs:
  let
    username = "joe";
    userfullname = "Joe Sullivan";
    useremail = "joe@truckstop.cloud";
    x64_system = "x86_64-linux";
    arm_system = "aarch64-linux";
    allSystems = [x64_system arm_system];

    nixosSystem = import ./lib/nixosSystem.nix;

  in {
    nixosConfigurations = 
    let
      oxygen_modules_gnome = {
        nixos-modules = [
          ./hosts/oxygen 
          ./desktop/gnome.nix
          agenix.nixosModules.default
          {nixpkgs.overlays = [ nur.overlay ];}
        ];
        home-module = import ./home/home.nix;
      };
      system = x64_system;
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          system = x64_system;
          config.allowUnfree = true;
        };
      }
      // inputs;
      base_args = {
        inherit home-manager nixos-generators system specialArgs;
      };
      stable_args = base_args // {inherit nixpkgs;};
      unstable_args = base_args // {nixpkgs = nixpkgs-unstable;};
    in {
      oxygen_gnome = nixosSystem (oxygen_modules_gnome // stable_args);
    };
    packages."${x64_system}" = 
      nixpkgs.lib.genAttrs [
        "oxygen_gnome"
      ] (
        host:
          self.nixosConfigurations.${host}.config.formats.iso
        );

  };
}
