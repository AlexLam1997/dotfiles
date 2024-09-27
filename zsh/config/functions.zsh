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

function git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function eks-list() {
  [[ $# -ne 2 ]] && echo "usage: eks-list account region" && return 1
  aws eks list-clusters \
    --profile lspay-"$1" \
    --region "$2"
}

function eks-conf() {
  [[ $# -ne 1 ]] && echo "usage: eks-conf cluster" && return 1
  ACCOUNT=$(echo "$1" | cut -d- -f2 | sed 's/tooling/prod/')
  REGION=$(echo "$1" | cut -d- -f3-5)
  CONTEXT=$(aws eks update-kubeconfig \
    --profile lspay-"$ACCOUNT" \
    --region "$REGION" \
    --name "$1" |
    awk -F'context' '{print $2}' |
    awk '{print $1}')
  kubectl config rename-context "$CONTEXT" "$ACCOUNT-$REGION"
}