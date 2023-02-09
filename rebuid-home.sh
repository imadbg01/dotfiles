#!/bin/sh

pushd ~/dotfiles

home-manager switch -f ./users/imad/home.nix

popd
