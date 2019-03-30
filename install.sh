#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Hidden files
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue

    ln -snfv "$DOTFILES/$f" "$HOME"/"$f"
done

# Karabiner
ln -snfv "$DOTFILES/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
