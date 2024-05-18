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

alias ll="ls -lah"
alias tmux="TERM=screen-256color tmux"

PS1='\[\e[93;2m\]\u\[\e[93m\]@\[\e[93m\]\h \[\e[0;1m\]\W \[\e[0;90m\]$(__git_ps1 "(%s) ")\[\e[0;2m\]\$ \[\e[0m\]'

# -----------------------------------------------------------------------------
# completions and so on

if [ "$(uname)" == "Darwin" ]; then
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
elif [ "$(uname)" == "Linux" ]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    . /usr/share/bash-completion/completions/git

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
. "$HOME/.cargo/env"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# -----------------------------------------------------------------------------
# system-specific

if [ -f "$HOME/.bashrc_local" ]; then
    . $HOME/.bashrc_local
fi
