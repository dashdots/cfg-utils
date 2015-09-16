#!/bin/bash

source ~/.git-completion.bash
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

alias ll='ls -lah'
alias gg='git status -s'
