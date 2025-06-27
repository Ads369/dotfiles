# Это ваш главный конфиг для Nushell.
# Он загружается при запуске Nushell.

# --- STARSHIP ---
# Starship поддерживает Nushell напрямую.
# Убедитесь, что Starship установлен.
# Вы можете установить Starship, следуя их документации: https://starship.rs/guide/#%F0%9F%9B%A0-installation
# Команда для инициализации Starship в Nushell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Устанавливаем путь к конфигу Starship
$env.STARSHIP_CONFIG = $"($env.HOME)/.config/starship/starship.toml"

# --- COMMON ---
# Nushell имеет собственные переменные окружения, многие из них уже установлены по умолчанию.
# Если что-то не работает как ожидалось, возможно, вам придётся подкорректировать.
# export LANG=en_US.UTF-8 (обычно не требуется явно в Nushell)
$env.config.show_banner = false
$env.config.buffer_editor = "zed"
$env.EDITOR = "nvim"

# # --- ALIASES ---
# # Алиасы в Nushell объявляются с помощью 'alias'.
# # Для внешних команд используйте 'external'.

# alias db = rainfrog

# zshrc
# alias reload = source $nu.config-path # $nu.config-path указывает на текущий файл конфига

def dot [] { cd ~/dotfiles | nvim . }

# Dir list, nav
# def pwdy [] { ^echo (pwd).path | pbcopy } # Используем ^echo для внешней команды
alias cl = clear
alias cat = bat

# navigation
# Nushell функции для cd
# def "cx" [target: path] {
#     cd $target
#     l
# }
# def "fcd" [] {
#     let selected_dir = (find . -type d -not-path '*/.*' | fzf)
#     if ($selected_dir | is-empty | not) {
#         cd $selected_dir
#         l
#     }
# }
# def "f" [] {
#     ^echo (find . -type f -not-path '*/.*' | fzf) | pbcopy
# }
# def "fv" [] {
#     nvim (find . -type f -not-path '*/.*' | fzf)
# }

# dirs
# Nushell поддерживает эти алиасы из коробки с помощью плагина 'cd'.
# Убедитесь, что у вас установлен плагин 'nu_plugin_cd'.
# Для этого вам нужно добавить его в список плагинов в вашем env.nu (см. ниже)
# и затем запустить `nu -c "plugin install nu_plugin_cd"`
# alias .. = "cd .."
# alias ... = "cd ../.."
# alias .... = "cd ../../.."
# alias ..... = "cd ../../../.."
# alias ...... = "cd ../../../../.."

# Obsidian
$env.OBSIDIAN_PATH = $"($env.HOME)/Library/Mobile Documents/iCloud~md~obsidian/Documents/ads_obsidian"
alias oo = cd $env.OBSIDIAN_PATH
alias or = vim $"($env.OBSIDIAN_PATH)/inbox/*.md"

# Nvim
alias n = nvim
alias vim = nvim
alias v = nvim
alias nn = nvim .

# VI Mode!!!
# В Nushell vi-режим переключается через `config.nu`
# В секции `keybindings` вашего `config.nu` (либо в отдельном файле, который вы сорсите)
# вы можете добавить:
# let keybindings = [
#   # ...
#   {
#     name: vi_normal_mode
#     modifier: "none"
#     keycode: "j"
#     mode: "insert"
#     event: {
#       send: "toggle_vi_mode"
#     }
#   }
# ]
# Но это будет просто переключение режима при двойном jj, не выполнение команды.
# Для более сложных биндингов vi, возможно, потребуется более глубокая настройка или плагины.
# Встроенный `bindkey` в Nushell отличается от Zsh.
# bindkey jj vi-cmd-mode # Это не будет работать напрямую как в Zsh.

# Zed
alias zz = zed .

# Python
# alias ss = source .venv/bin/activate # Активация venv в Nushell работает иначе, но эта команда может сработать.
# Если она не работает, вам нужно будет написать функцию, которая
# будет устанавливать PATH для venv, например:
# def "ss" [] {
#    let venv_path = (pwd).path + "/.venv/bin"
#    if (test -d $venv_path) {
#        $env.PATH = ($venv_path | append $env.PATH)
#        print "Virtual environment activated."
#    } else {
#        print "Error: .venv not found."
#    }
# }

# Lazy...
alias lzg = lazygit
alias lzd = lazydocker

# Tmux
alias tn = tmux new -s
alias ta = tmux attach -t
alias ide = ~/.dotfiles/zshrc/tmux_script_ide # Запуск внешних скриптов так же
alias idepy = ~/.dotfiles/zshrc/tmux_script_ide_py

# Git
# Для git алиасов в Nushell можно использовать либо прямые алиасы, либо функции для более сложных.
# alias gits = git status
# alias gita = git add -u
# def "gitm" [message: string] {
#     git commit -m $message
# }
# alias gitp = "git push"
# alias gitu = { git commit -m $"Update (date now | format date '%F')" }
# alias gitq = { | | git add -u; git commit -m $"Update (date now | format date '%F')"; git push }
# # alias gitc='aicommits' # Это внешняя команда, просто алиас
# alias gc = "git commit -m"
# alias gca = "git commit -a -m"
# alias gp = "git push origin HEAD"
# alias gpu = "git pull origin"
# alias gst = "git status"
# alias glog = { | | git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit }
# alias gdiff = "git diff"
# alias gco = "git checkout"
# alias gb = "git branch"
# alias gba = "git branch -a"
# alias gadd = "git add"
# alias ga = "git add -p"
# alias gcoall = "git checkout -- ."
# alias gr = "git remote"
# alias gre = "git reset"

# Jupyter
# alias jn = "jupyter notebook --no-browser"
# alias jc = "jupyter console"
# # Переменная окружения для Jupyter:
# $env.JUPYTER_NOTEBOOK_STYLE = "from IPython.display import HTML;HTML(\"<style>div.text_cell_render{font-size:130%;padding-top:50px;padding-bottom:50px}</style>\")"
# alias jl = "jupyter lab --core-mode"

# --- SETTINGS ---
# История в Nushell настраивается по-другому, через переменную $env.config.
# Следующие настройки идут в файл `env.nu`, но для истории:
# let-env config = {
#     history: {
#         max_size: 1000
#         sync_on_enter: true
#         # ... другие настройки истории
#     }
# }

# Автодополнение и подсветка синтаксиса
# В Nushell это встроено. Вам не нужны отдельные плагины, как в Zsh.
# Автодополнение работает "из коробки" для команд, файлов, флагов.
# Для более продвинутого автодополнения можно использовать 'completer'
# Например, для `fzf`:
# $env.config = {
#   # ...
#   completion: {
#       external: {
#           # ... можно настроить внешние completers здесь
#       }
#   }
# }

# zsh-autosuggestions и zsh-syntax-highlighting не нужны, Nushell имеет свои аналоги.
# Для bindkey '^w' autosuggest-execute и т.д.
# Nushell имеет свои биндинги. Вы можете настроить их в `config.nu`
# Например:
# let-env config = {
#   keybindings: [
#     {
#       name: "my_autosuggest_execute"
#       modifier: "control"
#       keycode: "w"
#       mode: "emacs" # или "vi"
#       event: {
#         send: "autosuggestion_accept" # Или другую команду, если это не та.
#       }
#     }
#     # ... другие биндинги
#   ]
# }
# Но функциональность "autosuggest-execute" и "autosuggest-toggle" может не быть 1:1.
# Nushell по умолчанию имеет функцию автодополнения, которую вы принимаете `Tab` или `Right arrow`.

# NVM (Node Version Manager)
# NVM скрипты для Bash/Zsh не работают напрямую.
# Вам нужно либо использовать другую систему управления версиями Node.js (например, 'fnm' или 'volta'),
# которая поддерживает Nushell, либо написать Nushell-совместимую функцию для загрузки NVM.
# Например, для fnm (популярный менеджер, поддерживающий Nushell):
# fnm env | save -f ~/.config/nushell/fnm.nu
# source ~/.config/nushell/fnm.nu

# ---- FZF -----
# fzf работает с Nushell, но интеграция немного отличается.
# Вместо eval "$(fzf --zsh)" вам нужно настроить fzf для Nushell.
# В большинстве случаев fzf работает как внешняя команда.
# Например, для функции `fcd` выше.
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
$env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow"

# ----- Bat (better cat) -----
# Уже сделано с alias cat = bat

# ---- Eza (better ls) -----
alias l = eza -l --icons --git -a
alias lt = eza --tree --level=2 --long --icons --git
alias ltree = eza --tree --level=2 --icons --git

# ---- TheFuck -----
# TheFuck требует специфической интеграции для каждого шелла.
# Для Nushell вы можете найти инструкции на их GitHub-странице или в документации Nushell.
# Часто это выглядит как:
# source (thefuck --alias nu) # Или похожая команда.
# eval (thefuck --alias)
# eval (thefuck --alias fk)
# Проверьте документацию TheFuck для Nushell.

# ---- Zoxide (better cd) ----
# Zoxide поддерживает Nushell.
# eval "$(zoxide init zsh)"
# Это будет выглядеть как:
zoxide init nushell | save -f ~/.config/nushell/zoxide.nu

# ---- Docker ----
# source /Users/ads/.docker/init-zsh.sh || true # Это специфично для Zsh
# Docker aliases
# alias dco = "docker compose"
# alias dps = "docker ps"
# alias dpa = "docker ps -a"
# alias dl = "docker ps -l -q"
# alias dx = "docker exec -it"
# alias docker_rm_all = "docker rm (docker ps -a -q)" # Nushell позволяет более легко вкладывать команды
# alias docker_rmi_all = "docker rmi (docker images -q)"
# alias docker_rmi_dangling = "docker rmi (docker images -qa -f 'dangling=true')"

# ---- Poetry ----
# alias po = "poetry"

# ---- Yazi ----
# def "y" [...args] {
#     let tmp = (mktemp -t "yazi-cwd.XXXXXX")
#     yazi $args --cwd-file $tmp
#     let cwd = (open $tmp | str trim)
#     if not ($cwd | is-empty) and ($cwd != (pwd).path) {
#         cd $cwd
#     }
#     rm -f $tmp
# }

# ---- NIX ----
# Эти переменные окружения лучше поместить в `env.nu`.
# Проверьте, как Nix взаимодействует с Nushell. Может потребоваться специфичная инициализация.
# Обычно Nix генерирует скрипт, который нужно `source`.
# Например, для NixOS или `nix-darwin`:
# source /etc/profiles/per-user/$env.USER/profile.d/nix.sh # Или аналогичный путь
# if (test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh') {
#    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# }
# alias drs = "darwin-rebuild switch --flake ~/dotfiles/nix#ads"

# ---- GO PATH ----
# Эти переменные окружения лучше поместить в `env.nu`.
# export PATH="$PATH:$(go env GOPATH)/bin"


# source ~/.config/nushell/zoxide.nu
source ~/dotfiles/nushell/scripts/findpkg.nu
