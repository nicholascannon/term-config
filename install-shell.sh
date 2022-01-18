#!/bin/zsh

echo "Installing zsh..."

ln -s -f $PWD/dotfiles/.zshrc $HOME/.zshrc

echo "Done"

echo "Installing fnm..."

brew install fnm

echo "Done"

