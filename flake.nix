{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "flake:home-manager";
    nix-darwin.url = "flake:nix-darwin";
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
