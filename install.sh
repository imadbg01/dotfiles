#!/usr/bin/env bash

function install() {
    cd $HOME;
    echo $HOME

    ln -s ${PWD}/git/gitconfig $HOME/gitconfig
    ln -s ${PWD}/git/gitignore $HOME/gitignore
    ln -s ${PWD}/git/gitmessage $HOME/gitmessage
    ln -s ${PWD}/fish/init.fish $HOME/.config/omf/init.fish
    ln -s ${PWD}/nvim/init.vim $HOME/.config/nvim/init.vim
}

install