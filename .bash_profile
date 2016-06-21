source ~/.git-completion.bash

## prompt setting
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0;32m\]$(parse_git_branch)\[\033[0m\]$ '

export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ls='ls -HFG'
alias ll='ls -l'
alias la='ls -A'
alias emacs='emacsclient -nw -a ""'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=/usr/local/bin:$PATH
