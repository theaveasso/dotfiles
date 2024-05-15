if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh
# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Bat alias
if [ -x "$(command -v bat)" ]; then
  alias cat="bat";
fi

# Alias
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
alias gpom='git pull origin main'
alias babaji='git reset --hard origin/main'

# Colored output
#alias ls='ls -laGH --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# yarn
alias ysd='yarn start:dev'
alias yd='yarn dev'

# rust
alias cwr='cargo watch -q -c -w src/ -x "run -q"'

# go - makefile
alias mb='make build'
alias mr='make run'

# docker
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# Setting Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> nvm initialize
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> go
export GO111MODULE=auto
export GO_DIR="$HOME/go"
export PATH=$PATH:$GO_DIR/bin

# >>> bin
export PATH="/Users/theaveasso/.local/bin:$PATH"

# bun completions
[ -s "/Users/theaveasso/.bun/_bun" ] && source "/Users/theaveasso/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export AR=/opt/homebrew/opt/llvm/bin/llvm-ar 
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

export PKG_CONFIG_PATH="/opt/homebrew/opt/jpeg/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/jpeg/lib"
export CPPFLAGS="-I/opt/homebrew/opt/jpeg/include"

# pnpm
export PNPM_HOME="/Users/vtech/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="~/.cache/rebar3/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
