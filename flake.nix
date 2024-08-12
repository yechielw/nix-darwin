{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "flake:home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "flake:nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        Yechiels-MacBook-Air = import ./darwinConfigurations/Yechiels-MacBook-Air.nix flakeContext;
      };
      homeConfigurations = {
        yechielworenklein = import ./homeConfigurations/yechielworenklein.nix flakeContext;
      };
    };
}
