# Installation Guide
> インストールガイド

## Prerequisites
> 前提条件

- **Linux/macOS** (or Windows; PowerShell scripts now supported without WSL)
> **Linux/macOS**（またはWindows。PowerShellスクリプトはWSLなしでサポートされています）
- AI coding agent: [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), [Codebuddy CLI](https://www.codebuddy.ai/cli) or [Gemini CLI](https://github.com/google-gemini/gemini-cli)
> AIコーディングエージェント: [Claude Code](https://www.anthropic.com/claude-code)、[GitHub Copilot](https://code.visualstudio.com/)、[Codebuddy CLI](https://www.codebuddy.ai/cli)、または[Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [uv](https://docs.astral.sh/uv/) for package management
> パッケージ管理用の[uv](https://docs.astral.sh/uv/)
- [Python 3.11+](https://www.python.org/downloads/)
> [Python 3.11以降](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
> [Git](https://git-scm.com/downloads)

## Installation
> インストール

### Initialize a New Project
> 新しいプロジェクトを初期化する

The easiest way to get started is to initialize a new project:
> 最も簡単な開始方法は、新しいプロジェクトを初期化することです。

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

Or initialize in the current directory:
> または現在のディレクトリで初期化します。

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init .
# or use the --here flag
uvx --from git+https://github.com/github/spec-kit.git specify init --here
```

### Specify AI Agent
> AIエージェントを指定する

You can proactively specify your AI agent during initialization:
> 初期化時に事前に使用するAIエージェントを指定できます。

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --ai claude
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --ai gemini
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --ai copilot
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --ai codebuddy
```

### Specify Script Type (Shell vs PowerShell)
> スクリプトタイプを指定する（ShellかPowerShellか）

All automation scripts now have both Bash (`.sh`) and PowerShell (`.ps1`) variants.
> すべての自動化スクリプトにはBash（`.sh`）とPowerShell（`.ps1`）の両方のバリエーションがあります。

Auto behavior:
> 自動判別の挙動:
- Windows default: `ps`
> - Windowsのデフォルト: `ps`
- Other OS default: `sh`
> - その他のOSのデフォルト: `sh`
- Interactive mode: you'll be prompted unless you pass `--script`
> - 対話モード: `--script`を指定しない場合はプロンプトが表示されます。

Force a specific script type:
> スクリプトタイプを強制的に指定するには次を実行します。
```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --script sh
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --script ps
```

### Ignore Agent Tools Check
> エージェントツールのチェックを無視する

If you prefer to get the templates without checking for the right tools:
> 必要なツールのチェックを行わずにテンプレートだけ取得したい場合:

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <project_name> --ai claude --ignore-agent-tools
```

## Verification
> 検証

After initialization, you should see the following commands available in your AI agent:
> 初期化後、AIエージェントで次のコマンドが使用可能になっていることを確認してください。
- `/speckit.specify` - Create specifications
> - `/speckit.specify` — 仕様を作成します。
- `/speckit.plan` - Generate implementation plans  
> - `/speckit.plan` — 実装計画を生成します。
- `/speckit.tasks` - Break down into actionable tasks
> - `/speckit.tasks` — 実行可能なタスクに分解します。

The `.specify/scripts` directory will contain both `.sh` and `.ps1` scripts.
> `.specify/scripts`ディレクトリには`.sh`と`.ps1`の両方のスクリプトが格納されます。

## Troubleshooting
> トラブルシューティング

### Git Credential Manager on Linux
> LinuxでのGit Credential Manager

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:
> LinuxでGit認証に問題がある場合は、Git Credential Managerをインストールできます。

```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```
