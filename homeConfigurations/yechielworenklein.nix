{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        homeDirectory = lib.mkForce /Users/yechielworenklein;
        stateVersion = "24.11";
        username = "yechielworenklein";
      };
      programs = {
        git = {
          userEmail = "41305372+yechielw@users.noreply.github.com";
          userName = "Yechiel Worenklein";
        };
        zellij = {
          enable = true;
        };
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.yechielworenklein = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    }
  ) // { inherit nixosModule; }
)
