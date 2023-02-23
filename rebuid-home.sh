#!/bin/sh

pushd ~/dotfiles

home-manager switch -f ./home/imad/home.nix --show-trace

popd
