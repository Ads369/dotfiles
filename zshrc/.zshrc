# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Export
# oh-my-zsh 
export ZSH="$HOME/.oh-my-zsh"
# poetry

# NNN
[ -f ~/.dotfiles/zshrc/.zshrc_nnn ] && source ~/.dotfiles/zshrc/.zshrc_nnn
export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo

# Theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="arrow"
ZSH_THEME="avit"


# Plugins
plugins=(
git
poetry
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Bind Fn+<-/Fn+-> to move begin/end of line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line


#Aliases
#Git
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git

# Neovim
alias n='nvim'

# Python
alias py=python3

# Docker aliases
alias dps='docker ps'

# Tmux
alias tn='tmux new -s'

# Poetry
alias po='poetry'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
