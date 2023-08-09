export BASH_SILENCE_DEPRECATION_WARNING=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ------------------------------------------------------------------------------
# history

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=-1
HISTFILESIZE=-1

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use fzf for shell history
if [ "$(uname)" == "Darwin" ]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
else
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# ------------------------------------------------------------------------------
# colors

# enable color support of ls and also add handy aliases
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export CLICOLOR=1
export MANPAGER="/usr/bin/less -R --use-color -Ddg -Du+y"

# ------------------------------------------------------------------------------
# completions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ------------------------------------------------------------------------------
# path

if [ "$(uname)" == "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin

# ------------------------------------------------------------------------------
# shell config

PS1='\[\e[2;3m\]\u\[\e[23m\]@\[\e[3m\]\h \[\e[0;1m\]\W \[\e[0;2m\]\$ \[\e[0m\]'

# ------------------------------------------------------------------------------
# aliases

alias ll="ls -lah"
alias vim=nvim
alias tmux='tmux -2'
