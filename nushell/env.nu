# Это ваш env-файл для Nushell. Он загружается перед config.nu
# и предназначен для установки переменных окружения и путей.

# --- PATH ---
# В Nushell вы управляете $env.PATH как список строк.
# $env.PATH = [
#   "/Users/ads/.local/bin"
#   ($env.PATH | split row (char esep)) # Добавляем старый PATH, если он существует
# ]
# Гораздо проще и рекомендуемее добавлять элементы к PATH так:
$env.PATH = ($env.PATH | prepend "/Users/ads/.local/bin")

# Python
# Если у вас есть специальные пути для Python/pip, добавляйте их сюда.
# Для симлинков, как вы упоминали, это будет работать, если они в PATH.
# alias py=python3 (это алиас, в config.nu)

# NIX
$env.NIX_CONF_DIR = $"($env.HOME)/.config/nix"
$env.PATH = ($env.PATH | prepend "/run/current-system/sw/bin")

# Carapace
# опционально: позволяет Carapace использовать завершения из других оболочек
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'


# Nix-daemon
# Убедитесь, что этот путь актуален для вашей установки Nix.
# if (test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh') {
    # Nushell не может напрямую 'source' bash/zsh скрипты.
    # Вам нужно будет выполнить скрипт и захватить его вывод, чтобы установить переменные.
    # Это может быть сложно, и для Nix часто рекомендуется использовать `direnv` с `nu_plugin_direnv`.
    # Или же установить `nix` так, чтобы он сам добавлял свои бинарники в PATH.
    # Как временное решение:
    # let nix_env = (bash -c 'source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; env')
    # Это не идеальное решение и может быть медленным. Лучше найти нативную интеграцию с Nushell.
# }

# Go Path
# $env.PATH = ($env.PATH | append (go env GOPATH | get "bin"))

# Dotenv (если у вас есть такой файл)
# Обычно это `source ~/.local/bin/env`
# В Nushell:
# if (test -e $"($env.HOME)/.local/bin/env") {
#     # Если это Bash/Zsh скрипт, то прямое выполнение не сработает.
#     # Вам нужно будет либо переписать его на Nushell, либо
#     # использовать что-то вроде `nu_plugin_direnv` для загрузки `.env` файлов.
#     # Если это просто переменные вида KEY=VALUE, можно так:
#     # (open $"($env.HOME)/.local/bin/env" | lines | each { |it|
#     #   if ($it =~ "=") {
#     #     let [key, value] = ($it | split row "=" | at 0 1)
#     #     $env.($key) = $value
#     #   }
#     # })
# }


# --- Nushell plugins ---
# Здесь вы можете объявить плагины Nushell, которые хотите использовать.
# Например, для поддержки '..' '...' и т.д.:
# plugin add nu_plugin_cd # Для 'cd ../../..'
# plugin add nu_plugin_direnv # Для автоматической загрузки .env файлов
# plugin add nu_plugin_clipboard # Для pbcopy/xclip
# После добавления, вам нужно будет установить их:
# nu -c "plugin install nu_plugin_cd"
# nu -c "plugin install nu_plugin_direnv"
# и т.д.

# --- Настройки истории ---
# Это нужно добавить в секцию `let-env config` в вашем `config.nu`
# $env.config = {
#     history: {
#         max_size: 1000
#         sync_on_enter: true
#         # ... другие настройки истории
#     }
#     # ... другие настройки
# }
