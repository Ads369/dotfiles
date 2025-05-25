# Path to your oh-my-zsh installation.
# Reevaluate the prompt string each time it's displaying a prompt
# setopt prompt_subst
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit
# compinit


# source /nix/share/zsh-autosuggestions/share/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ${pkgs.awscli}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# ---- STARSHIP -----
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml


# ---- COMMON -----
export LANG=en_US.UTF-8
export EDITOR=nvim


# ---- ALIAS -----
alias db="rainfrog"


# zshrc
alias reload="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
alias dot='cd $HOME/dotfiles && nvim .'

# Dir list, nav
alias pwdy="echo $(pwd) | pbcopy"
alias cl="clear"
alias cat=bat

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Obsidian
export OBSIDIAN_PATH="$HOME/library/Mobile Documents/iCloud~md~obsidian/Documents/ads_obsidian"
alias oo='cd $OBSIDIAN_PATH'
alias or='vim $OBSIDIAN_PATH/inbox/*.md'


# Nvim
alias n='nvim'
alias vim='nvim'
alias v='nvim'
alias nn='nvim .'

# VI Mode!!!
bindkey jj vi-cmd-mode

# Zed
alias zz='zed .'


# Python
# Note: use symlinks, e.g.
# >>> ln -vs /opt/homebrew/bin/python3.9 ~/bin/python
# >>> ln -vs /opt/homebrew/bin/pip3.9 ~/bin/pip
alias ss='source .venv/bin/activate'
# alias py=python3
# alias python3.12=/opt/homebrew/bin/python3.12
# alias pip3.12=/opt/homebrew/bin/pip3.12
# alias pyv=$HOME/virtualenvs/adhoc/bin/python
# alias piv=$HOME/virtualenvs/adhoc/bin/pip

# Lazy...
alias lzg=lazygit
alias lzd=lazydocker

# Tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias ide='~/.dotfiles/zshrc/tmux_script_ide'
alias idepy='~/.dotfiles/zshrc/tmux_script_ide_py'

# Git
alias gits='git status'
alias gita='git add -u'
gitm() { git commit -m "$1" }
alias gitp='git push'
alias gitu='git commit -m "Update $(date +%F)"'
alias gitq='git add -u && git commit -m "Update $(date +%F)" && git push'
# alias gitc='aicommits' # requires aicommits installed (https://github.com/Nutlope/aicommits)
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'


# Jupyter
alias jn='jupyter notebook --no-browser'
alias jc='jupyter console'
export JUPYTER_NOTEBOOK_STYLE='from IPython.display import HTML;HTML("<style>div.text_cell_render{font-size:130%;padding-top:50px;padding-bottom:50px}</style>")'
alias jl='jupyter lab --core-mode' # Fix for M1 mac


# ---- SETTINGS -----
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


# plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# plugins=(
#     poetry
#     poetry-env
#     git
#     zsh-autosuggestions
#     zsh-syntax-highlighting
# )

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---- PATH -----
# # oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
# # poetry
# export PATH="/Users/ads/.local/bin:$PATH"

# ---- FZF -----
### Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
### Use fd instead of fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# ----- Bat (better cat) -----
#

# ---- Eza (better ls) -----
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"


# ---- TheFuck -----
# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
# alias cd="z"




# ---- Docker ----
# source /Users/ads/.docker/init-zsh.sh || true # Added by Docker Desktop
# Docker aliases
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"
#
alias docker_rm_all="docker rm \`docker ps -a -q\`"
alias docker_rmi_all="docker rmi \`docker images -q\`"
alias docker_rmi_dangling="docker rmi \`docker images -qa -f 'dangling=true'\`"

# ---- Poetry  ----
alias  po="poetry"


# ---- Yazi  ----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# ---- NIX  ----
export NIX_CONF_DIR=$HOME/.config/nix
export PATH=/run/current-system/sw/bin:$PATH
alias  drs="darwin-rebuild switch --flake ~/dotfiles/nix#ads"
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

. "$HOME/.local/bin/env"
