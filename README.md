# dotfiles

Reference and Upstream from <https://github.com/agalea91/.dotfiles>

## Configs

```bash
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf # For system
ln -s ~/.dotfiles/tmux/tmux.conf ~/.dotfiles/.tmux.conf # For correct update
ln -s ~/.dotfiles/zshrc/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/zshrc/.zshrc ~/.dotfiles/.zshrc
```

## Scripts

### Update

```bash
~/.dotfiles/scripts/update.sh
```

```bash
ln -s ~/.dotfiles/bin/on ~/bin/on
ln -s ~/.dotfiles/bin/og ~/bin/og
```

## Test performance of Termianl

```bash
time cat ~/.dotfiles/Bible.txt
```
