#!/bin/bash

# ----------------------------------------------------------------------------------
# 特定のプレフィックスを持つレポジトリに対して一括でgitのフックであるpre-pushをコピーするスクリプト
# ----------------------------------------------------------------------------------

# ディレクトリのパス
BASE_DIR=~/directory/path/to/git_repositories

# コピーしたいpre-pushの置いてあるディレクトリのパス
ORIGIN_PRE_PUSH_DIR=~/directory/path/to/your/pre-push

# コピー先のディレクトリのプレフィックス
TARGET_DIR_PREFIX=pre_fix_*

# 対象ディレクトリのリストを取得
ROOK_DIRS=$(find "$BASE_DIR" -maxdepth 1 -type d -name "$TARGET_DIR_PREFIX")

# 各ディレクトリに対して処理を実行
for DIR in $ROOK_DIRS; do
    # .git/hooks ディレクトリが存在するか確認
    HOOKS_DIR="$DIR/.git/hooks"
    if [ -d "$HOOKS_DIR" ]; then
        # pre-push ファイルをコピー
        cp -i $ORIGIN_PRE_PUSH_DIR/pre-push "$HOOKS_DIR"
        echo "Copied pre-push file to $DIR"
        
        # 実行権限を付与
        chmod a+x "$HOOKS_DIR/pre-push"
        echo "Added execute permission to pre-push file in $DIR"
    else
        echo "Hooks directory not found in $DIR"
    fi
done

echo "Script execution completed."
