source $HOME/.zsh/config/variables.zsh
source $HOME/.zsh/config/aliases.zsh
source $HOME/.zsh/config/functions.zsh

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh 

# # Local using dev
# if ! [[ "$SPIN" = 1 ]]
# then
#   if [ -e /Users/alexanderlam/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alexanderlam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
#   [[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
#   [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
#   [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
# fi
