# Nix Config

Download nix:
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Download home-manager:
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

To apply NixOS config:
```
sudo nixos-rebuild switch --flake .#nixos
```

To update packages:
```
nix flake update
```

New packages should be declared in `~/nix/home-manager/`, to apply changes run:
```
home-manager switch --flake ~/.dotfiles/nix#kuko
```

Clearing garbage collector:
```
nix-collect-garbage 
nix store gc
```
or
```
nix-collect-garbage --delete-old
```

## Ref
[nix-starter-configs template](https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file)
[NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/introduction/)
