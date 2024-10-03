{
    description = "ozflake";
    
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            ozvm = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozvm/system.nix
                    ./hosts/ozvm/hardware.nix
                ];
            };
        };
        homeConfigurations = {
            oz = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./users/oz/config.nix
                    ./users/oz/packages.nix
                ];
            };
        };
    };
}