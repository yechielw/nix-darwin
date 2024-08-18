{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      targets.darwin = {
        defaults."com.apple.dock".orientation = "left";
        currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
      };
      home = {
        homeDirectory = lib.mkForce /Users/yechielworenklein;
        stateVersion = "24.11";
        username = "yechielworenklein";
      };
      programs = {
        wezterm = {
          enable = true;
          extraConfig = ''
            local wezterm = require 'wezterm';
            return {
              color_scheme = "Catppuccin Mocha",
              font = wezterm.font("JetBrainsMono NFM"),
              font_size = 14.0,
              -- default_prog = {"zsh", "-c", "zellij", "a", "-c"},
              enable_tab_bar = false,
              window_close_confirmation = "NeverPrompt",
            } 
          '';
        };
        bash = {
          enable = true;
          shellAliases = {
            ll = "ls -l";
            ".." = "cd ..";
            blabal = "blababalbal";
          };
        };
        git = {
          enable = true;
          userEmail = "41305372+yechielw@users.noreply.github.com";
          userName = "Yechiel Worenklein";
        };
        atuin = {
          enable = true;
          flags = [
            "--disable-up-arrow"
          ];
          settings = {
            enter_accept = true;
            style =  "compact";
            sync.records = true;
          };
        };
        alacritty = {
          enable = true;
          settings = {
            window.opacity = 0.8;
            font = {
              normal.family = "JetBrainsMono NFM";
              size = 14.0;
            };
            colors = {
              indexed_colors = [{color = "#fab387"; index = 16;} {color = "#f5e0dc"; index = 17;}];
              bright = {
                black = "#585b70";blue = "#89b4fa";cyan = "#94e2d5";green = "#a6e3a1";magenta = "#f5c2e7";red = "#f38ba8";white = "#a6adc8";yellow = "#f9e2af";
              };
              cursor = {
                cursor = "#f5e0dc";text = "#1e1e2e";
              };
              dim = {
                black = "#45475a";blue = "#89b4fa";cyan = "#94e2d5";green = "#a6e3a1";
                magenta = "#f5c2e7";red = "#f38ba8";white = "#bac2de";yellow = "#f9e2af";
              };
              footer_bar = {background = "#a6adc8";foreground = "#1e1e2e";};
              hints = {
                end = {background = "#a6adc8";foreground = "#1e1e2e";};
                start = {background = "#f9e2af";foreground = "#1e1e2e";};
              };
              normal = {black = "#45475a";blue = "#89b4fa";cyan = "#94e2d5";green = "#a6e3a1";magenta = "#f5c2e7";red = "#f38ba8";white = "#bac2de";yellow = "#f9e2af";};
              primary = {background = "#1e1e2e";bright_foreground = "#cdd6f4";dim_foreground = "#7f849c";foreground = "#cdd6f4";};
              search = {
                focused_match = {background = "#a6e3a1";foreground = "#1e1e2e";};
                matches = {background = "#a6adc8";foreground = "#1e1e2e";};
              };
              selection = {background = "#f5e0dc";text = "#1e1e2e";};
              vi_mode_cursor = {cursor = "#b4befe";text = "#1e1e2e";};
              };
          };
        };
        home-manager = {
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
