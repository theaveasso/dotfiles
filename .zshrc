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

# Lazygit alias
if [ -x "$(command -v lazygit)" ]; then
    alias gg="lazygit"
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
alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gpll='git pull'
alias gpsh='git push'
alias gd='git diff'
alias gl='git log --stat --graph --decorate --oneline'

# Colored output
#alias ls='ls -laGH --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# Setting Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> nvim initialize >>>
function nvims() {
    items=("default" "nvchad" "astheo" "lazy" "astro")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config="nvchad"
    fi
    NVIM_APPNAME=$config nvim $@
}

bindkey -s ^v "nvims\n"
# <<< nvim initialize <<<

# >>> nvm initialize >>>
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# <<< nvm initialize <<<

# >>> go
export GO_DIR="$HOME/go"
export PATH=$PATH:$GO_DIR/bin

# >>> ocaml
[[ ! -r /Users/theaveasso/.opam/opam-init/init.zsh ]] || source /Users/theaveasso/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# >>> asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

[ -f "/Users/theaveasso/.ghcup/env" ] && source "/Users/theaveasso/.ghcup/env" # ghcup-env