# alt-ime-ahk-v2f（カスタマイズ版）

左右の Alt キーの空打ちで IME を OFF/ON する AutoHotkey v2 スクリプト。
[ryobeam/alt-ime-ahk-v2f](https://github.com/ryobeam/alt-ime-ahk-v2f) 1.0.1 をベースに、自分用に手を入れたもの。

## できること

| キー | 動作 |
| --- | --- |
| 左 Alt 空打ち | IME OFF（英数） |
| 右 Alt 空打ち | IME ON（かな） |
| Alt + C / V / X / Z / A / S / F / T / W / L / Enter | Ctrl + 同じキー（Mac の Command 風） |
| Alt + R（ブラウザのみ） | 再読み込み |
| Alt + Shift + R（ブラウザのみ） | スーパーリロード（キャッシュ無視） |
| Alt + [ / Alt + ] | 戻る / 進む（ブラウザ・エクスプローラー・VS Code / Cursor など） |
| Win + F | 選択中の文字列を Google 検索 |

- Alt を押している間に他のキーを打つと通常の Alt として動作する
- リモートデスクトップ（mstsc.exe）上では IME 切り替えを無効化
- ブラウザ = Chrome / Edge / Firefox / Brave

### オリジナルからの主な変更点

- 単独 Alt のマスク用ダミーキーを `F13` → `vkE8`（未割り当て）に変更。
  `F13` だと WSL などのターミナルで `Alt+F13` のエスケープシーケンスが流れ、`;3~` と入力されてしまうため
- `CapsLock::~` と PgUp / PgDn の入れ替えを削除（CapsLock → Ctrl は PowerToys Keyboard Manager 側で設定）
- Alt を Command キー風に使うショートカットを追加。PowerToys の左 Ctrl + H/J/K/L/[ の割り当てと衝突しないよう右 Ctrl を送る
- ブラウザ用の Alt + R / Alt + Shift + R を追加

## セットアップ

前提: Windows 側に AutoHotkey v2 がインストールされていること（`winget install AutoHotkey.AutoHotkey`）。

WSL から実行する:

```sh
bash ~/dotfiles/windows/autohotkey/alt-ime-ahk-v2f/install.sh
```

- `%USERPROFILE%\tools\alt-ime-ahk-v2f\` にコピーし、AutoHotkey で再起動する
- スタートアップにショートカットが無ければ作成する
- **このディレクトリの `.ahk` を編集したら、再度 `install.sh` を実行して反映する**
  （ログイン時に WSL の起動待ちにならないよう、WSL 内を直接参照せず Windows 側にコピーして使う）

## ファイル

- `alt-ime-ahk-v2f.ahk` … 本体
- `IMEv2.ahk` … IME 制御ライブラリ（オリジナル同梱のまま）
- `.ahk` は CRLF / BOM をそのまま保つため `.gitattributes` で改行変換を無効にしている

## クレジット / ライセンス

- [ryobeam/alt-ime-ahk-v2f](https://github.com/ryobeam/alt-ime-ahk-v2f) — Copyright (C) 2025-2026 ryo
- 元になった alt-ime-ahk: [karakaram](http://www.karakaram.com/alt-ime-on-off)
- [SorrowBlue/alt-ime-ahk-mod-v2](https://github.com/SorrowBlue/alt-ime-ahk-mod-v2)
- [nekocodeX/alt-ime-ahk-mod](https://github.com/nekocodeX/alt-ime-ahk-mod)
- [IMEv2.ahk](https://qiita.com/kenichiro_ayaki/items/d55005df2787da725c6f)

GPLv2（[LICENSE](./LICENSE)）。
