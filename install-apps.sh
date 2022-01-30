#!/bin/zsh

echo "Installing apps..."

ln -s -f $PWD/dotfiles/.vimrc $HOME/.vimrc
ln -s -f $PWD/dotfiles/.coc.vim $HOME/.coc.vim
ln -s -f $PWD/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/dotfiles/.prettierrc $HOME/.prettierrc

echo "Done!"

