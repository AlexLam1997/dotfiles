#!/bin/zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> log.out || echo "oh-my-zsh already installed."
# Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &> log.out || echo "auto-suggestions already installed" 

DOTFILE_DIR=$(pwd)

# Link dotfiles
ln -sfn $DOTFILE_DIR/.zshenv ~/.zshenv

ln -sfn $DOTFILE_DIR/zsh ~/.zsh
# ln -sfn $DOTFILE_DIR/zsh/.zshrc ~/.zshrc 

ln -sfn $DOTFILE_DIR/.gitconfig ~/.gitconfig

source $ZDOTDIR/.zshrc
