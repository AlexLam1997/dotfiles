# Functions
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

# Isospin functions
function debug() {
  local repo=${1:-email}    
  sc stop proc-shopify--"$repo"@server.service
  RAILS_ENV=development RACK_TIMEOUT_SERVICE_TIMEOUT=false bin/rails server -p $PORT
  # Add commands to start job processes in other tabs
}

function open_db {
  # Opens sql ace with db config for current instance. $1 is the repo name
  local repo=${1:-email};
  if [[ "$repo" = email ]]
  then
    local schema=${2:-email_development}
  else
    local schema=${2:-shopify_dev_shard_0}
  fi

  open "mysql://root@$repo.$(spin show -o fqdn --latest):$(spin shell -- cat /home/spin/src/github.com/Shopify/$repo/.shadowenv.d/500-spin-svc-mysql.lisp | grep MYSQL_PORT | egrep -o '\d*')/$schema" -a "Sequel Ace"
}

#Spin functions
function graphql() {
  if [[ $1 = 'legacy' ]]
  then
    open "https://app.$(spin show -o fqdn --latest)/services/internal/shops/1/graphql"
  else
    open "https://app.shopify.$(spin show -o fqdn --latest)/services/internal/shops/1/graphql"
  fi
}

# Kills active servers
function kill(){
  kill -9 $(cat tmp/pids/server.pid)
}

function graphql_email() {
  # https://email.nui9.alexander-lam.us.spin.dev/graphiql
  if [[ $1 = 'legacy' ]]
  then
    open "https://$(spin show -o fqdn --latest)/graphiql"
  else
    open "https://email.$(spin show -o fqdn --latest)/graphiql"
  fi
}

function admin() {
  if [[ $1 = 'legacy' ]]
  then
    open "https://$(spin show -o fqdn --latest)/admin"
  else
    open "https://shop1.shopify.$(spin show -o fqdn --latest)/admin"
  fi
}

function internal_email() {
  if [[ $1 = 'legacy' ]]
  then
    open "https://$(spin show -o fqdn --latest)/management/internal/shops/1"
  else
    open "https://email.$(spin show -o fqdn --latest)/management/internal/shops/1"
  fi
}

function internal_shopify(){
  if [[ $1 = 'legacy' ]]
  then
    open "https://app.$(spin show -o fqdn --latest)/services/internal/shops/1"
  else
    open "https://app.shopify.$(spin show -o fqdn --latest)/services/internal/shops/1"
  fi
}

function letter_opener() {
  if [[ $1 = 'legacy' ]]
  then
    open "https://$(spin show -o fqdn --latest)/letter_opener"
  else
    open "https://email.$(spin show -o fqdn --latest)/letter_opener"
  fi
}