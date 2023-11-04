#!/bin/bash
# git clone https://github.com/bitcode001/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

stow -vt ~ bash
stow -vt ~ nvim
stow -vt ~ tmux
stow -vt ~ --ignore=zsh-res zsh
# stow -vt ~ --ignore='\(sys\|temp\)' zsh   # to ignore multiple folder
