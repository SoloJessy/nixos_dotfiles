# What is Where?

## Configuration.nix

This file contains bare bones packages to setup my environment.

it also inputs other files that setup things that are not configured using home-manager.

## flake.nix

This file sets up package versioning to ensure reproducabity.

sets up:
- home-home-manager
- fenix (nightly rust)

## flake.lock
the file that you should never touch, but that declares everything

## home.nix

This file contains my home-manager configuration.
It configures most everything that needs it.

## steam.nix

This file sets-up and configures steam and its supporting programs for me.

## systems-config.nix

This file contains all the basic configuration to get my system working.
