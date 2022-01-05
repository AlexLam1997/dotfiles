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