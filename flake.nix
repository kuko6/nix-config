{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    # system = "aarch64-linux"
    system = "x86_64-linux";
    
    # maybe this also works 
    # system = builtins.getEnv "NIX_SYSTEM" or "x86_64-linux";
    
    pkgs = nixpkgs.legacyPackages.${system};
   in {
    homeConfigurations = {
      kuko = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
    templates = {
      python = mkWelcomeText {
        name = "Python Template";
        description = "A simple python template";
        path = "./templates/python.nix";
      };
    };
  };
}
