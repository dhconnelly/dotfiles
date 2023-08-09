export BASH_SILENCE_DEPRECATION_WARNING=1

# cargo
. "$HOME/.cargo/env"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export LIBRARY_PATH="$(brew --prefix)/lib"
export CPATH="$(brew --prefix)/include"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# go
export PATH=$PATH:$HOME/go/bin

# gcc
alias g++=g++-12
export PATH=/opt/homebrew/Cellar/gcc/12.2.0/bin:$PATH

# openjdk
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# shell config
PS1='\[\e[2;3m\]\u\[\e[23m\]@\[\e[3m\]\h \[\e[0;1m\]\W \[\e[0;2m\]\$ \[\e[0m\]'
export CLICOLOR=1
export MANPAGER="/usr/bin/less -R --use-color -Ddg -Du+y"

# use fzf for shell history
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tmux
alias tmux='tmux -2'

# >>> coursier install directory >>>
export PATH="$PATH:/Users/dhc/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

alias ll="ls -lah"
alias vim=nvim
