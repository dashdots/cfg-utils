#!/bin/bash

#
# Work
#//////////

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

CQLSH_NO_BUNDLED=true


#
# Personal
#//////////

### Node configs

function autonode {
  if [[ ! -f package.json ]] ; then
    return 1
  fi
  local readonly DESIRED_NODE_VERSION="$(node -pe "const pj = require('./package.json'); pj.engines && pj.engines.node || ''" 2> /dev/null)"
  local readonly CURRENT_NODE_VERSION=$(nvm current)
  local readonly DESIRED_NODE_VERSION_REGEXED=${DESIRED_NODE_VERSION//[!0-9.]/}
  local readonly CURRENT_NODE_VERSION_REGEXED=${CURRENT_NODE_VERSION//[!0-9.]/}
  if [[ $DESIRED_NODE_VERSION_REGEXED != $CURRENT_NODE_VERSION_REGEXED && ${DESIRED_NODE_VERSION_REGEXED} != ${CURRENT_NODE_VERSION_REGEXED%??} ]]; then
    nvm use "${DESIRED_NODE_VERSION//[!0-9.]/}"
  fi
}

### Bash configs

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### Git configs

source ~/.git-prompt.sh

YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
RED="\[\033[0;31m\]"
GIT_PS1_SHOWDIRTYSTATE=true

export PS1=$GREEN'\t'$WHITE' [\w]$(
  if [[ $(__git_ps1) =~ \*\)$ ]]
  # a file has been modified but not added
  then echo "'$RED'"$(__git_ps1 " (%s)")
  elif [[ $(__git_ps1) =~ \+\)$ ]]
  # a file has been added, but not commited
  then echo "'$YELLOW'"$(__git_ps1 " (%s)")
  # the state is clean, changes are commited
  else echo "'$GREEN'"$(__git_ps1 " (%s)")
  fi)'$WHITE' $ '

### Aliases

alias ls='ls -G'
alias gs='git status'
alias gp='git pull'
alias gl="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=format:'%Y-%m-%d %H:%M:%S'"
alias gcm="git checkout master"
alias gc.="git checkout ."
alias gc="git checkout"
alias gd="git diff"
alias gb="git branch"
alias tt="tree -I 'node_modules|ui'"
alias e="exit"
