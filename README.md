Run 
```bash 
nix build .#darwinConfigurations.Yechiels-MacBook-Air.system 
```
ro get the bineries installed

Run 
```bash
darwin-rebuild switch --flake .
home-manager switch --flake .
```
