# setup-my-osx

このリポジトリはAnsibleを使用してmacOSの開発環境を自動的にセットアップするためのツールです。

## 概要

このツールは以下のコンポーネントの設定を自動化します：

- Fish Shell
- Visual Studio Code
- dotfiles
- macOSシステム設定
- Homebrew
- mise

## 前提条件

- `macOS`で動作します
- `Ansible`がインストールされている必要があります
- コード整形をする場合は`yamlfmt`がインストールされている必要があります

## デプロイ方法

```bash
make deploy
```

このコマンドは`localhost.yml`プレイブックを実行し、すべてのロールを適用します。管理者権限が必要で、パスワードの入力を求められます。

## コード整形

```bash
make format
```

これにより`yamlfmt`を使用してコードが整形されます。
