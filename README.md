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

## 必要条件

### macOSで動作します

### デプロイするには以下がインストールされている必要があります

> [!NOTE]
> `Homebrew`インストール時に`Xcode Command Line Tools`と`Git`も同時にインストールされます。

- `Homebrew`
- `Xcode Command Line Tools`
- `Git`
- `Ansible`

### コード整形をする場合は以下がインストールされている必要があります

- `ansible-lint`

## デプロイ方法

```bash
# すべてのロールを適用
make deploy

# 特定のタグのみ実行
make deploy TAGS=fish

# 複数のタグを指定
make deploy TAGS="fish,homebrew"
```

このコマンドは`localhost.yml`プレイブックを実行します。管理者権限が必要なためパスワードの入力を求められます。

## コード整形

```bash
make format
```

これにより`ansible-lint`を使用してYAMLが整形されます。
