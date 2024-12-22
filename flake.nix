{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default-linux";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, systems, ... 
  
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );    
  in {
    # NixOS configuration entrypoint
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [ 
          ./nixos/configuration.nix # path to the main NixOS configuration                
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kuko = import ./home-manager/home.nix;
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };

    # Home manger configuration entrypoint
    homeConfigurations = {
      kuko = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor.builtins.currentSystem;
        modules = [ ./home-manager/home.nix ];
      };
      
      # arm = home-manager.lib.homeManagerConfiguration {
      #   # inherit pkgs;
      #   pkgs = pkgsFor.aarch64-linux;
      #   modules = [./home-manager/home.nix];
      # };

      # x86 = home-manager.lib.homeManagerConfiguration {
      #   # inherit pkgs;
      #   pkgs = pkgsFor.x86_64-linux;
      #   modules = [./home-manager/home.nix];
      # };
    };
    
    templates = {
      python = {
        description = "A simple python template";
        path = ./templates/python;
      };
    };
  };
}
