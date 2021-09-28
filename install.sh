#!/bin/zsh
FILES=".gitconfig .tmux.conf .gitignore .zshrc"
DOTFILE_DIR=$(pwd)

#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install ohmyzsh
if ! command -v zsh &> /dev/null
then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Get ohmyzsh plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done
