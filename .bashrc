export BASH_SILENCE_DEPRECATION_WARNING=1

HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

export VISUAL=vim
export EDITOR=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export CLICOLOR=1
export MANPAGER="/usr/bin/less -R --use-color -Ddg -Du+y"

alias l="ls -lh"
alias ll="ls -lah"
alias tmux="TERM=screen-256color tmux"

PS1='\[\e[93;2m\]\u\[\e[93m\]@\[\e[93m\]\h \[\e[0;1m\]\W \[\e[0;90m\]$(__git_ps1 "(%s) ")\[\e[0;2m\]\$ \[\e[0m\]'

# -----------------------------------------------------------------------------
# completions and so on

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "$(uname)" == "Darwin" ]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
elif [ "$(uname)" == "Linux" ]; then
    . /usr/share/bash-completion/completions/git
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# -----------------------------------------------------------------------------
# path

if [ "$(uname)" == "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# go, rustup, sdkman
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# -----------------------------------------------------------------------------
# system-specific

if [ -f "$HOME/.bashrc_local" ]; then
    . $HOME/.bashrc_local
fi
