# ---- STARSHIP -----
eval "$(starship init zsh)"

# ---- ALIAS -----
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# Obsidian
export OBSIDIAN_PATH="$HOME/library/Mobile Documents/iCloud~md~obsidian/Documents/ads_obsidian"
alias oo='cd $OBSIDIAN_PATH'
alias or='vim $OBSIDIAN_PATH/inbox/*.md'
# alias ou='cd $HOME/notion-obsidian-sync-zazencodes && node batchUpload.js --lastmod-days-window 5'

# Path shortcuts
alias dot='cd $HOME/.dotfiles && zed .'

# Dir list, nav
alias pwdy="echo $(pwd) | pbcopy"
alias cl="clear"

# Neovim
alias n='nvim'
alias vim='nvim'
alias v='nvim'

# Python
# Note: use symlinks, e.g.
# >>> ln -vs /opt/homebrew/bin/python3.9 ~/bin/python
# >>> ln -vs /opt/homebrew/bin/pip3.9 ~/bin/pip
alias py=python3
alias python3.12=/opt/homebrew/bin/python3.12
alias pip3.12=/opt/homebrew/bin/pip3.12
alias pyv=$HOME/virtualenvs/adhoc/bin/python
alias piv=$HOME/virtualenvs/adhoc/bin/pip

# LazyGit
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
plugins=(
    poetry
    poetry-venv
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    pyenv
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---- PATH -----
# oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
# poetry
export PATH="/Users/ads/.local/bin:$PATH"

# ---- FZF -----
### Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

### -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----
export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- TheFuck -----
# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- NNN ----
[ -f ~/.dotfiles/zshrc/.zshrc_nnn ] && source ~/.dotfiles/zshrc/.zshrc_nnn
export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo

# ---- pyenv ----
export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PATH:$PYENV_ROOT/bin"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# ---- Docker ----
source /Users/ads/.docker/init-zsh.sh || true # Added by Docker Desktop
# Docker aliases
alias dps='docker ps'
alias docker_rm_all="docker rm \`docker ps -a -q\`"
alias docker_rmi_all="docker rmi \`docker images -q\`"
alias docker_rmi_dangling="docker rmi \`docker images -qa -f 'dangling=true'\`"


# tabby
alias tabby_start='tabby serve --device metal --model StarCoder-3B'
