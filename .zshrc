export ZSH="${ZDOTDIR:-$HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Git Aliases
# Prune branch
alias pb="git fetch --prune && git branch -vv | grep ': gone]'|  grep -v '\*' | awk '{ print \$1; }' | xargs git branch -d"
alias pbf="git fetch --prune && git branch -vv | grep ': gone]'|  grep -v '\*' | awk '{ print \$1; }' | xargs git branch -D"
# Force push
alias fp="git push --force-with-lease"
# Commit fixup
alias cf="git add . && git commit --fixup HEAD"

# Other Aliases
alias val="rubocop && dev t"
alias up="dev up && dev s"
alias down="dev down"

function ff(){
  git add .
  git commit -am'f' --fixup HEAD
  if [ -n "$1" ]
  then
    git rebase -i HEAD~$1
  else
    git rebase -i HEAD~2
  fi
}

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

#if [ -e /Users/alexlam/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/alexlam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
