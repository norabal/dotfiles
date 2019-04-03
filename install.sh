#!/bin/bash

set -u

THIS_DIR=$(cd $(dirname $0); pwd)
CURRENT_DIR=$(pwd)

cat << START

**************************************************
DOTFILES SETUP STARTED!
**************************************************

dotfiles repo directory: ${THIS_DIR}"

START

# Hidden files
echo "Move to '$THIS_DIR'..."
cd "$THIS_DIR"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue

    ln -s "$THIS_DIR/$f" "$HOME"/"$f"
done

echo "Back to '$CURRENT_DIR'..."
cd "$CURRENT_DIR"

# Karabiner
ln -s "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# Prezto
if [[ -d "$HOME/.zprezto/runcoms" ]]; then
  rm -r "$HOME/.zprezto/runcoms"
fi
ln -s "$THIS_DIR/zprezto/runcoms" "$HOME/.zprezto/runcoms"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
