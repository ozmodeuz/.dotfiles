{
    description = "ozflake";
    
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, home-manager, nixpkgs, nixpkgs-unstable, ... }:
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
        desktop = "gnome"; # budgie, cinnamon, gnome, plasma
    in {
        nixosConfigurations = {
            ozpc = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozpc/system.nix
                    ./hosts/ozpc/hardware.nix
                    ./hosts/ozpc/desktops/${desktop}.nix
                ];
            };
            ozvm = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozvm/system.nix
                    ./hosts/ozvm/hardware.nix
                    ./hosts/ozvm/desktops/${desktop}.nix
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
                    ./users/oz/desktops/${desktop}.nix
                ];
            };
        };
    };
}