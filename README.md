# Nix Config

Download nix:
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Download home-manager:
```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager &&
nix-channel --update &&
nix-shell '<home-manager>' -A install
```

To apply NixOS config:
```sh
sudo nixos-rebuild switch --flake .#nixos
```

To update packages:
```sh
nix flake update
```

New packages should be declared in `~/nix/home-manager/`, to apply changes run:
```sh
home-manager switch --flake ~/.dotfiles/nix#arm
```

Clearing garbage collector:
```sh
nix-collect-garbage 
nix store gc
```
or to also delete all generations
```sh
sudo nix-collect-garbage --delete-old
```

## Ref
- [nix-starter-configs template](https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/introduction/)
- [Changing default shell on home-manager](https://discourse.nixos.org/t/using-home-manager-to-control-default-user-shell/8489/2)
