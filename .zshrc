if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh

# Color exa alias
if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

# Bat alias
if [ -x "$(command -v bat)" ]; then
  alias cat="bat";
fi

# Alias
# dev
alias rnd="npm run start:dev"

alias q='exit'
alias ..='cd ..'
alias ls='lsd -Fl'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'

# vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias nv='neovide'

# git
alias gw='git worktree'
alias glo='git log --oneline'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gpll='git pull'
alias gpsh='git push'
alias gd='git diff'
alias gco='git checkout'
alias gss='git stash'
alias gssp='git stash pop'
alias gssc='git stash clear'
alias gl='git log --stat --graph --decorate --oneline'
alias gpma='git pull origin master'

# Colored output
#alias ls='ls -laGH --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# rust
alias cwr='cargo watch -q -c -w src/ -x "run -q"'

# Setting Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> nvm initialize >>>
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# <<< nvm initialize <<<

# >>> go
export GO111MODULE=auto
export GO_DIR="$HOME/go"
export PATH=$PATH:$GO_DIR/bin

# >>> ocaml
[[ ! -r /Users/theaveasso/.opam/opam-init/init.zsh ]] || source /Users/theaveasso/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# >>> asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# >>> bin
export PATH="/Users/theaveasso/.local/bin:$PATH"

# >>> haskell
source ~/.ghcup/env


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/theaveasso/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PATH:/opt/homebrew/opt/sphinx-doc/bin"

export PATH="$PATH:$HOME/.cabal/bin"

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# bun completions
[ -s "/Users/theaveasso/.bun/_bun" ] && source "/Users/theaveasso/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# starship
# eval "$(starship init zsh)"
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd

alias re="$ANDROID_SDK_ROOT/emulator/emulator"
alias adb="$ANDROID_SDK_ROOT/platform-tools/adb"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export AR=/opt/homebrew/opt/llvm/bin/llvm-ar 

# avm
export PATH="~/.avm/bin:$PATH"
