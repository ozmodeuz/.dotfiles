{
    description = "ozflake";
    
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
                (import ./overlays/arcmenu.nix)
                (import ./overlays/displayswitcher.nix)
                (import ./overlays/deskflow.nix)
            ];
        };
        desktop = "gnome"; # budgie, cinnamon, gnome, plasma
    in {

        nixosConfigurations = {
            ozpc = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozpc/config.nix
                    ./hosts/ozpc/hardware.nix
                    ./hosts/ozpc/desktops/${desktop}.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.extraSpecialArgs = {
                            inherit inputs;
                            inherit pkgs;
                        };
                        home-manager.users.oz.imports = [
                            ./users/oz/user.nix
                            ./users/oz/desktops/${desktop}.nix
                        ];
                    }
                ];
            };
            ozvm = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/ozvm/config.nix
                    ./hosts/ozvm/hardware.nix
                    ./hosts/ozvm/desktops/${desktop}.nix
                ];
            };
        };
        /*homeConfigurations = {
            oz = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                inherit system;
                extraSpecialArgs = {
                    inherit unstablePkgs;
                };
                modules = [
                    ./users/oz/user.nix
                    ./users/oz/desktops/${desktop}.nix
                ];
            };
        };*/
    };
}
