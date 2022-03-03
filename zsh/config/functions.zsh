# Github functions
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

# Isospin functions - run within a spin instance

# Restarts the spin 'server' proc in the foreground to allow the debugger to be attached
function debug() {
  local repo=${1:-email}    
  sc stop proc-shopify--"$repo"@server.service
  RAILS_ENV=development RACK_TIMEOUT_SERVICE_TIMEOUT=false bin/rails server -p $PORT
}

# Kills active servers
function kill(){
  kill -9 $(cat tmp/pids/server.pid)
}

# Utility functions - run locally

# Opens sql ace with db config for current instance.
# Accepts repo name as first argument, defaults to email
function open_db {
  local repo=${1:-email};
  if [[ "$repo" = email ]]
  then
    local schema=${2:-email_development}
  else
    local schema=${2:-shopify_dev_shard_0}
  fi

  spin_instance_name=$(spin show -o name)
  spin_fqdn=$(spin show $spin_instance_name -o fqdn)
  my_sql_port=$(spin shell $spin_instance_name -- cat /home/spin/src/github.com/Shopify/$repo/.shadowenv.d/500-spin-svc-mysql.lisp | grep MYSQL_PORT | egrep -o '\d*')
  open "mysql://root@$repo.$spin_fqdn:$my_sql_port/$schema" -a "Sequel Ace"
}

# The following functions open the specified resource
function graphql() {
  open "https://app.shopify.$(spin show -o fqdn --latest)/services/internal/shops/1/graphql"
}

function graphql_email() {
  open "https://email.$(spin show -o fqdn --latest)/graphiql"
}

function admin() {
  open "https://shop1.shopify.$(spin show -o fqdn --latest)/admin"
}

function internal_email() {
  open "https://email.$(spin show -o fqdn --latest)/management/internal/shops/1"
}

function internal_shopify(){
  open "https://app.shopify.$(spin show -o fqdn --latest)/services/internal/shops/1"
}

function letter_opener() {
  open "https://email.$(spin show -o fqdn --latest)/letter_opener"
}