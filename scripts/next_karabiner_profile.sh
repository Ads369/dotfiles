#!/usr/bin/env zsh

alias kb="/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"

# Get the list of items
IFS=$'\n' items=($(kb --list-profile-names))

# Get the current item
current_item=$(kb --show-current-profile-name)

# Find the index of the current item
for i in {1..$#items}; do
  if [[ "${items[$i]}" == "$current_item" ]]; then
    current_index=$i
    break
  fi
done

# Determine the next index
if [[ $current_index -eq $#items ]]; then
  next_index=1
else
  next_index=$((current_index + 1))
fi

# Select the next item
next_profile="${items[$next_index]}"
kb --select-profile $next_profile
echo "$next_profile selected"
