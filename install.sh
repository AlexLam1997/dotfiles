FILES=".gitconfig .tmux.conf .gitignore .zpreztorc .zshrc"
DOTFILE_DIR=$(pwd)

#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done
