#!/bin/bash

set -u

THIS_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)
CURRENT_DIR=$(pwd)

cat << START

**************************************************
DOTFILES SETUP STARTED!
**************************************************

dotfiles repo directory: ${THIS_DIR}"

START

echo "Create symlink for Hidden files..."
echo "Move to '$THIS_DIR'..."

cd "$THIS_DIR" || { echo "Could not move"; exit 1; }

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".idea" ]] && continue
    [[ "$f" == ".pre-commit-config.yaml" ]] && continue

    ln -svi "$THIS_DIR/$f" "$HOME"/"$f"
done

echo "Back to '$CURRENT_DIR'..."
cd "$CURRENT_DIR" || { echo "Could not move"; exit 1; }

echo "Create symlink for secret_settings"
ln -svi "$HOME/GoogleDrive/secret_settings/.ssh" "$HOME"
ln -svi "$HOME/GoogleDrive/secret_settings/.aws" "$HOME"

echo  "Create symlink for Karabiner..."
ln -svi "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo  "Create symlink for neovim..."
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/dein/config"
ln -svi "$THIS_DIR/neovim/init.vim" "$HOME/.config/nvim/init.vim"
ln -svi "$THIS_DIR/neovim/dein.toml" "$HOME/.config/dein/config/dein.toml"
ln -svi "$THIS_DIR/neovim/dein_lazy.toml" "$HOME/.config/dein/config/dein_lazy.toml"

# WARNING: If you are using JetBrains Toolbox, creating symlink will be failed.
echo  "Create symlink for intelij..."
for f in "$HOME"/Library/Preferences/IntelliJIdea*
do
    ln -svi "$THIS_DIR/intelij/idea.vmoptions" "$f/idea.vmoptions"
done

echo  "Create symlink for Prezto..."
if [[ -d "$HOME/.zprezto/runcoms" ]]; then
  rm -r "$HOME/.zprezto/runcoms"
fi
ln -svi "$THIS_DIR/zprezto/runcoms" "$HOME/.zprezto/runcoms"

echo "Display hidden files on Finder.app..."
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
