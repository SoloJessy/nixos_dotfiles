alias r := rebuild

rebuild:
    sudo nixos-rebuild switch --flake .

update:
    sudo nix flake update
