#!/bin/zsh

echo "Installing env..."

#ln -s -f $PWD/.zshrc $HOME/.zshrc
ln -s -f $PWD/.vimrc $HOME/.vimrc
ln -s -f $PWD/.coc.vim $HOME/.coc.vim
ln -s -f $PWD/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/.prettierrc $HOME/.prettierrc

echo "Done"

