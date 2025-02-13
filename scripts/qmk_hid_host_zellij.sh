#!/bin/bash

SESSION_NAME="qmk-hid-host"

if zellij list-sessions | grep -q "^$SESSION_NAME$"; then
  echo "Session $SESSION_NAME already exists. Detaching..."
  zellij attach --session "$SESSION_NAME" --detach
else
  echo "Creating session $SESSION_NAME and starting the program..."
  zellij --session "$SESSION_NAME" run -- ./Users/ads/dotfiles/vial/qmk-hid-host/qmk-hid-host
fi
