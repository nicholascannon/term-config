#!/bin/zsh

echo "Installing zsh..."

echo "source $PWD/dotfiles/.my-zsh-conf" >> $HOME/.zshrc

if [ ! -f "$HOME/.private-shell-conf" ]; then
    echo ".private-shell-conf does not exist. Making empty one"
    touch $HOME/.private-shell-conf
else
    echo ".private-shell-conf exists!"
fi

echo "Done!"

echo "Installing fnm..."

brew install fnm

echo "Done!"

