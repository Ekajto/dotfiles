{

  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixgl.url = "github:nix-community/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
    homeConfigurations = {
      work = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/work.nix ];
      };
      personal = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/personal.nix ];
      };
    };
  };
}
