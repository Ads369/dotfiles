for dir in */; do
    # Remove trailing slash from directory name
    dir=${dir%/}

    # Skip any directories you don't want to stow
    case $dir in
        "." | ".." | ".git")
            continue
            ;;
    esac

    echo "Linking $dir"
    # Remove existing link or directory if it exists
    rm -rf ~/.config/"$dir"
    # Create new symlink
    ln -s "$PWD/$dir" ~/.config/"$dir"
done

# Special case for zsh configuration if needed
if [ -f "zsh/.zshrc" ]; then
    ln -sf "$PWD/zsh/.zshrc" ~/.zshrc
fi
