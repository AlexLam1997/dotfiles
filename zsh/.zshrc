# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  fast-syntax-highlighting 
  # zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh 

source $HOME/.zsh/config/variables.zsh
source $HOME/.zsh/config/aliases.zsh
source $HOME/.zsh/config/functions.zsh
