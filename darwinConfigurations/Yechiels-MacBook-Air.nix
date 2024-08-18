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
        enable = true;
      };
      environment = {
        systemPackages = with pkgs; [
          neovim
          go
          nodejs_22
          wget
          gzip
          unzip
          gcc
          curl
          git
          termshark
          home-manager
          lazydocker
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
          "wezterm"
        ];
        enable = true;
      };
      security = {
        pam = {
          enableSudoTouchIdAuth = true;
        };
      };
      system = {
        defaults = {
          dock = {
            autohide = true;
            autohide-delay = 0.0;
            largesize = 16;
            tilesize = 59;
            show-recents = false;
            persistent-apps = [
              "/Applications/Google Chrome.app"
              "/Applications/iTerm.app"
              "/Applications/Firefox.app"
              "/Applications/Burp Suite Professional.app"
              "/Applications/Obsidian.app"
              "/System/Applications/Preview.app"
              "/System/Applications/TextEdit.app"
              "/Applications/Microsoft Teams (work or school).app"
            ];

          };
          finder = {
            AppleShowAllExtensions = true;
            _FXShowPosixPathInTitle = true;
            CreateDesktop = false;
            FXDefaultSearchScope = "SCcf";
            FXEnableExtensionChangeWarning = false;
            FXPreferredViewStyle = "Nlsv";
            ShowPathbar = true;
          };
          trackpad = {
            Clicking = true;
            TrackpadRightClick = true;
          };
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
