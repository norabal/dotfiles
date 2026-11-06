#!/bin/bash
# ----------------------------------------------------------------------------------
# WSL から実行する。
# alt-ime-ahk-v2f を Windows 側 (%USERPROFILE%\tools\alt-ime-ahk-v2f) にコピーし、
# AutoHotkey v2 で再起動する。スタートアップのショートカットが無ければ作成する。
#
# AutoHotkey はログイン直後に起動するため、WSL 内のファイルを直接読ませると
# WSL の起動待ちで遅延・失敗する。そのため Windows 側へコピーして使う。
# ----------------------------------------------------------------------------------

set -eu

SRC_DIR=$(cd "$(dirname "$0")" && pwd)
WIN_SYS32=/mnt/c/Windows/System32
CMD="$WIN_SYS32/cmd.exe"
POWERSHELL="$WIN_SYS32/WindowsPowerShell/v1.0/powershell.exe"
AHK_EXE_WIN='C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe'
FILES=(alt-ime-ahk-v2f.ahk IMEv2.ahk LICENSE README.md)

# Windows のコマンドは UNC パス (WSL 内) を作業ディレクトリにすると警告を出すため移動しておく
cd /mnt/c

WIN_USERPROFILE=$("$CMD" /c 'echo %USERPROFILE%' 2>/dev/null | tr -d '\r')
DEST_WIN="${WIN_USERPROFILE}\\tools\\alt-ime-ahk-v2f"
DEST=$(wslpath -u "$DEST_WIN")
SCRIPT_WIN="${DEST_WIN}\\alt-ime-ahk-v2f.ahk"

if [ ! -f "$(wslpath -u "$AHK_EXE_WIN")" ]; then
    echo "AutoHotkey v2 が見つからない: $AHK_EXE_WIN" >&2
    echo "Windows 側で 'winget install AutoHotkey.AutoHotkey' を実行してからやり直すこと" >&2
    exit 1
fi

echo "Copy to $DEST_WIN"
mkdir -p "$DEST"
for f in "${FILES[@]}"; do
    command cp -fv "$SRC_DIR/$f" "$DEST/$f"
done

echo "Create startup shortcut if missing"
"$POWERSHELL" -NoProfile -Command "
\$lnk = Join-Path ([Environment]::GetFolderPath('Startup')) 'alt-ime-ahk-v2f.lnk'
if (Test-Path \$lnk) { Write-Host \"exists: \$lnk\"; exit }
\$s = (New-Object -ComObject WScript.Shell).CreateShortcut(\$lnk)
\$s.TargetPath = '$AHK_EXE_WIN'
\$s.Arguments = '\"$SCRIPT_WIN\"'
\$s.WorkingDirectory = '$DEST_WIN'
\$s.Save()
Write-Host \"created: \$lnk\"
"

echo "Restart AutoHotkey"
"$POWERSHELL" -NoProfile -Command "Start-Process -FilePath '$AHK_EXE_WIN' -ArgumentList '/restart','\"$SCRIPT_WIN\"' -WorkingDirectory '$DEST_WIN'"

echo "Done."
