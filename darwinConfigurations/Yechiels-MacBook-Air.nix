{ inputs, ... }@flakeContext:
let
  darwinModule = { config, lib, pkgs, ... }: {
    imports = [
      inputs.home-manager.darwinModules.home-manager
      inputs.self.homeConfigurations.yechielworenklein.nixosModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
    config = {
      documentation = {
        enable = false;
      };
      environment = {
        systemPackages = [
          pkgs.neovim
          pkgs.go
          pkgs.nodejs_22
          pkgs.wget
          pkgs.gzip
          pkgs.unzip
          pkgs.gcc
          pkgs.curl
          pkgs.git
        ];
      };
      homebrew = {
        casks = [
          "aerospace"
          "alacritty"
          "alt-tab"
          "android-platform-tools"
          "anydesk"
          "betterdisplay"
          "betterzip"
          "espanso"
          "google-chrome"
          "hiddenbar"
          "iina"
          "iterm2"
          "maccy"
          "obsidian"
          "raycast"
          "shortcat"
          "shottr"
          "slack"
          "spaceman"
          "zed"
        ];
        enable = true;
      };
      security = {
        pam = {
          enableSudoTouchIdAuth = true;
        };
      };
      services = {
        nix-daemon = {
          enable = true;
        };
      };
    };
  };
in
inputs.nix-darwin.lib.darwinSystem {
  modules = [
    darwinModule
  ];
  system = "aarch64-darwin";
}
