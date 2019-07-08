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

echo "Create symlink for Hidden files..."
echo "Move to '$THIS_DIR'..."

cd "$THIS_DIR"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue
    [[ "$f" == ".pre-commit-config.yaml" ]] && continue

    ln -svi "$THIS_DIR/$f" "$HOME"/"$f"
done

echo "Back to '$CURRENT_DIR'..."
cd "$CURRENT_DIR"

echo  "Create symlink for Karabiner..."
ln -svi "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# WARNING: If you are using JetBrains Toolbox, creating symlink will be failed.
echo  "Create symlink for intelij..."
for f in $HOME/Library/Preferences/IntelliJIdea*
do
    ln -svi "$THIS_DIR/intelij/idea.vmoptions" "$f/idea.vmoptions"
done

echo  "Create symlink for Prezto..."
if [[ -d "$HOME/.zprezto/runcoms" ]]; then
  rm -r "$HOME/.zprezto/runcoms"
fi
ln -sv "$THIS_DIR/zprezto/runcoms" "$HOME/.zprezto/runcoms"

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
