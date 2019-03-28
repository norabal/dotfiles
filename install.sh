#!/bin/bash

DOTFILES="$HOME/dotfiles"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue

    ln -snfv "$DOTFILES/$f" "$HOME"/"$f"
#    echo "$f"
done
