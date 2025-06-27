#!/bin/bash

# Получаем ID текущего приложения (Ghostty)
APP_ID="$AEROSPACE_APP_ID"
APP_NAME="$AEROSPACE_APP_NAME"
WINDOW_ID="$AEROSPACE_WINDOW_ID"

# Проверяем, что это действительно Ghostty и что мы получили ID
if [[ "$APP_NAME" != "Ghostty" || -z "$APP_ID" ]]; then
    exit 0
fi

# Получаем список всех окон Ghostty
# ВНИМАНИЕ: Здесь мы фильтруем по `manage=true` чтобы исключить уже плавающие окна,
# которые мы, возможно, уже сделали плавающими вручную или по другому правилу.
# Если вы хотите учитывать все окна, уберите `manage=true`.
GHOSTTY_WINDOWS=$(aerospace list-windows -r | jq -r ".[] | select(.app_name == \"Ghostty\") | .id")

# Считаем количество активных (не свернутых, не скрытых) окон Ghostty
# (это более надежный способ, чем просто `wc -l`, так как учитывает только видимые окна)
GHOSTTY_VISIBLE_WINDOW_COUNT=$(echo "$GHOSTTY_WINDOWS" | wc -l)

# Отладочный вывод (можно закомментировать после отладки)
# echo "Ghostty detected: App ID=$APP_ID, Window ID=$WINDOW_ID, Visible Windows=$GHOSTTY_VISIBLE_WINDOW_COUNT" >> ~/aerospace_debug.log

# Логика: если это первое окно, оно будет тайловым. Если не первое, оно будет плавающим.
if [[ "$GHOSTTY_VISIBLE_WINDOW_COUNT" -eq 1 ]]; then
    # Это первое окно Ghostty, делаем его тайловым
    aerospace layout tiling
    # echo "Window $WINDOW_ID (Ghostty) set to tiling." >> ~/aerospace_debug.log
else
    # Это последующее окно Ghostty, делаем его плавающим
    aerospace layout floating
    # echo "Window $WINDOW_ID (Ghostty) set to floating." >> ~/aerospace_debug.log
fi

exit 0
