#!/bin/bash

set -u

THIS_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)

cat << START

**************************************************
VSCODE DOTFILES SETUP STARTED!
**************************************************

dotfiles repo directory: ${THIS_DIR}"

START

echo "Create symlink for Hidden files..."
echo "Move to '$THIS_DIR'..."

cd "$THIS_DIR" || { echo "Could not move"; exit 1; }
rm "$HOME/.gitconfig"
ln -svi "$THIS_DIR/.gitconfig" "$HOME/.gitconfig"

cat << END

**************************************************
VSCODE DOTFILES SETUP FINISHED! bye.
**************************************************

END
