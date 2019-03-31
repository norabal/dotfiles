#!/bin/bash

set -u

THIS_DIR=$(cd $(dirname $0); pwd)

cat << START

**************************************************
DOTFILES SETUP STARTED!
**************************************************

dotfiles repo directory: $THIS_DIR"

START

# Hidden files
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue

    ln -snfv "$THIS_DIR/$f" "$HOME"/"$f"
done

# Karabiner
ln -snfv "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# Prezto
if [[ -d "$HOME/.zprezto/runcoms" ]]; then
  rm -r "$HOME/.zprezto/runcoms"
fi
ln -snfv "$THIS_DIR/zprezto/runcoms" "$HOME/.zprezto/runcoms"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
