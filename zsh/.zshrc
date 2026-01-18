# ============================================================
# Zinit setup
# ============================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# ============================================================
# Prompt
# ============================================================
zinit ice depth=1
zinit light romkatv/powerlevel10k

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ============================================================
# Plugins
# ============================================================
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# OMZ snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# ============================================================
# Completion
# ============================================================
autoload -Uz compinit
compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ============================================================
# History
# ============================================================
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ============================================================
# Keybindings
# ============================================================
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ============================================================
# Aliases
# ============================================================
alias ls='ls --color'
alias lsl='ls -l'
alias v='nvim'
alias vim='nvim'
alias c='clear'
alias k='fzf-kill'

# ============================================================
# Command not found handler
# ============================================================
command_not_found_handler() {
  local cmd="$1"
  cowsay -r "The command '$cmd' don't work bru"
  return 127
}

# ============================================================
# Shell integrations
# ============================================================
#eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"

# ============================================================
# wal colors
# ============================================================
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# ============================================================
# PATH
# ============================================================
export PATH="$PATH:$HOME/.spicetify"

