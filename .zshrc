# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Export
# oh-my-zsh 
export ZSH="$HOME/.oh-my-zsh"
# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# NNN
[ -f ~/.dotfiles/.zshrc_nnn ] && source ~/.dotfiles/.zshrc_nnn
export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo

# Theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"


# Plugins
plugins=(
git
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

# Docker aliases
alias dps='docker ps'

# Tmux
alias tn='tmux new -s'

# Poetry
alias po='poetry'

# I Don't know what is it
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
