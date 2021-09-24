export ZSH="${ZDOTDIR:-$HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias cb="git fetch --prune && git branch -vv | grep ': gone]'|  grep -v '\*' | awk '{ print \$1; }' | xargs git branch -d"
alias cbf="git fetch --prune && git branch -vv | grep ': gone]'|  grep -v '\*' | awk '{ print \$1; }' | xargs git branch -D"
alias up="dev up && dev s"
alias down="dev down"
alias val="rubocop && dev t"
#if [ -e /Users/alexlam/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alexlam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Functions
function graphql() {
  open "https://app.$(spin info fqdn)/services/internal/shops/1/graphql"
}

function graphql_email() {
  open "https://$(spin info fqdn)/graphiql"
}

function sqla() {
  open "mysql://root@$(spin info fqdn)/shopify_dev_shard_0" -a "Sequel Ace"
}

function admin() {
   open "https://$(spin info fqdn)/admin"
}

function internal_email() {
  open "https://$(spin info fqdn)/management/internal/shops/1"
}

function internal_shopify(){
  open "https://app.$(spin info fqdn)/services/internal/shops/1"
}

function letter_opener() {
  open "https://$(spin info fqdn)/letter_opener"
}

function ff(){
  if [ -n "$1" ]
  then
    git rebase -i HEAD~$1
  else
    git rebase -i HEAD~2
  fi
}
