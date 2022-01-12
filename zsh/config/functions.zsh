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

function db() {
  mysql -u root -P "$MYSQL_PORT" -e "GRANT ALL PRIVILEGES ON *.* to 'root'@'%';"
}

function open_db() {
  host=${1:-c1fb}
  port=${2}
  open "mysql://root:@shop1.shopify."$host".alexander-lam.us.spin.dev:"$port""
}

#Spin functions
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