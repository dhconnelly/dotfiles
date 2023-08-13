export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f "$HOME/.bashrc_local" ]; then
    . $HOME/.bashrc_local
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR=nvim

# -----------------------------------------------------------------------------
# history

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# use fzf for shell history
if [ "$(uname)" == "Darwin" ]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
else
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# -----------------------------------------------------------------------------
# colors

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export CLICOLOR=1
export MANPAGER="/usr/bin/less -R --use-color -Ddg -Du+y"

# -----------------------------------------------------------------------------
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

# -----------------------------------------------------------------------------
# path

if [ "$(uname)" == "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
fi
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# -----------------------------------------------------------------------------
# shell config

. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

PS1='\[\e[2;3m\]\u\[\e[23m\]@\[\e[3m\]\h \[\e[0;1m\]\W \[\e[0;2m\]$(__git_ps1 "(%s) ")\$ \[\e[0m\]'
export CLICOLOR=1
export MANPAGER="/usr/bin/less -R --use-color -Ddg -Du+y"


# -----------------------------------------------------------------------------
# aliases

alias ll="ls -lah"
alias vim=nvim
alias tmux='tmux -2'
