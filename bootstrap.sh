#!/bin/zsh

# Only run nested steps in Spin workspaces.
if [[ "$SPIN" = 1 ]]
then
  # Only run nested steps in Spin + shopify/shopify workspaces.
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cartridge insert AlexLam1997/bootstrap
    . /cartridges/bootstrap/setup.sh
  fi
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> log.out || echo "oh-my-zsh already installed."
# Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &> log.out || echo "auto-suggestions already installed" 

FILES=".gitconfig .gitignore"
DOTFILE_DIR=$(pwd)

#Zsh
ln -sfn $DOTFILE_DIR/zsh ~/.zsh
ln -sfn $DOTFILE_DIR/zsh/.zshrc ~/.zshrc 

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done

source ~/.zshrc
