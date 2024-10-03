{
    description = "ozflake";
    
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
        unstablePkgs = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
        };
        profile = "gnome"; # budgie, cinnamon, gnome, plasma
    in {
        nixosConfigurations = {
            ozpc = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozpc/system.nix
                    ./hosts/ozpc/hardware.nix
                    ./hosts/ozpc/profiles/${profile}.nix
                ];
            };
            ozvm = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozvm/system.nix
                    ./hosts/ozvm/hardware.nix
                    ./hosts/ozvm/profiles/${profile}.nix
                ];
            };
        };
        homeConfigurations = {
            oz = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                    inherit unstablePkgs;
                };
                modules = [
                    ./users/oz/user.nix
                    ./users/oz/packages.nix
                    ./users/oz/profiles/${profile}.nix
                ];
            };
        };
    };
}