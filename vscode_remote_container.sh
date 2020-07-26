#!/bin/bash

set -u

THIS_DIR=$(cd "$(dirname "$0")" || exit; pwd)

cat << START

**************************************************
VSCODE DOTFILES SETUP STARTED!
**************************************************

dotfiles repo directory: ${THIS_DIR}"

START

echo "Create symlink for Hidden files..."
echo "Move to '$THIS_DIR'..."

cd "$THIS_DIR" || { echo "Could not move"; exit 1; }
ln -svi "$THIS_DIR/.gitignore_global" "$HOME/.gitignore_global"
git config --global core.excludesfile ~/.gitignore_global

cat << END

**************************************************
VSCODE DOTFILES SETUP FINISHED! bye.
**************************************************

END
