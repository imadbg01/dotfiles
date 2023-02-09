#!/bin/sh

pushd ~/dotfiles

sudo nixos-rebuild switch -I nixos-config=./system/nixos/configuration.nix

popd
