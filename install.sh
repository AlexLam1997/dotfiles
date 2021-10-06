#!/bin/bash
FILES=".gitconfig .tmux.conf .gitignore .zshrc"
DOTFILE_DIR=$(pwd)

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo "oh-my-zsh already installed."
# Get ohmyzsh plugins
{
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
} || {
  echo "auto-suggestions already installed" 
}

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done
