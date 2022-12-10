{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
	inherit system;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
	zhoufan = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix ];
	};
      };
    };
}
