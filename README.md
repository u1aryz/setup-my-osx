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

### macOSで動作します

### デプロイするには以下がインストールされている必要があります

- `Xcode Command Line Tools`
- `Ansible`
- `Git`
- `Homebrew`

### コード整形をする場合は以下がインストールされている必要があります

- `ansible-lint`

## デプロイ方法

```bash
make deploy
```

このコマンドは`localhost.yml`プレイブックを実行し、すべてのロールを適用します。管理者権限が必要なためパスワードの入力を求められます。

## コード整形

```bash
make format
```

これにより`ansible-lint`を使用してYAMLが整形されます。
