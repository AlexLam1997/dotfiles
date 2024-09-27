# Local aliases
alias k="kubectl"

# Git aliases
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