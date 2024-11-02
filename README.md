# Nix Config

To update packages:
```
nix flake update
```

New packages should be declared in `~/nix/home-manager/`, to apply changes run:
```
home-manager switch --flake .#kuko
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
