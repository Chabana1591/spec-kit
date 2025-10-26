<div align="center">
    <img src="./media/logo_small.webp"/>
    <h1>🌱 Spec Kit</h1>
    <h3><em>Build high-quality software faster.</em></h3>
    <h3><em>高品質なソフトウェアをより速く構築する。</em></h3>
</div>

<p align="center">
    <strong>An open source toolkit that allows you to focus on product scenarios and predictable outcomes instead of vibe coding every piece from scratch.</strong>
</p>
<p align="center">
    <strong>すべてを手探りで実装するのではなく、プロダクトシナリオと再現性のある成果に集中できるオープンソースのツールキットです。</strong>
</p>

<p align="center">
    <a href="https://github.com/github/spec-kit/actions/workflows/release.yml"><img src="https://github.com/github/spec-kit/actions/workflows/release.yml/badge.svg" alt="Release"/></a>
    <a href="https://github.com/github/spec-kit/stargazers"><img src="https://img.shields.io/github/stars/github/spec-kit?style=social" alt="GitHub stars"/></a>
    <a href="https://github.com/github/spec-kit/blob/main/LICENSE"><img src="https://img.shields.io/github/license/github/spec-kit" alt="License"/></a>
    <a href="https://github.github.io/spec-kit/"><img src="https://img.shields.io/badge/docs-GitHub_Pages-blue" alt="Documentation"/></a>
</p>

---

## Table of Contents
> 目次

- [🤔 What is Spec-Driven Development?](#-what-is-spec-driven-development)
- [⚡ Get Started](#-get-started)
- [📽️ Video Overview](#️-video-overview)
- [🤖 Supported AI Agents](#-supported-ai-agents)
- [🔧 Specify CLI Reference](#-specify-cli-reference)
- [📚 Core Philosophy](#-core-philosophy)
- [🌟 Development Phases](#-development-phases)
- [🎯 Experimental Goals](#-experimental-goals)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn More](#-learn-more)
- [📋 Detailed Process](#-detailed-process)
- [🔍 Troubleshooting](#-troubleshooting)
- [👥 Maintainers](#-maintainers)
- [💬 Support](#-support)
- [🙏 Acknowledgements](#-acknowledgements)
- [📄 License](#-license)
> - [🤔 Spec-Driven Developmentとは？](#-what-is-spec-driven-development)
> - [⚡ はじめに](#-get-started)
> - [📽️ 動画概要](#️-video-overview)
> - [🤖 対応AIエージェント](#-supported-ai-agents)
> - [🔧 Specify CLIリファレンス](#-specify-cli-reference)
> - [📚 中核となる考え方](#-core-philosophy)
> - [🌟 開発フェーズ](#-development-phases)
> - [🎯 実験的な目標](#-experimental-goals)
> - [🔧 前提条件](#-prerequisites)
> - [📖 さらに学ぶ](#-learn-more)
> - [📋 詳細なプロセス](#-detailed-process)
> - [🔍 トラブルシューティング](#-troubleshooting)
> - [👥 メンテナー](#-maintainers)
> - [💬 サポート](#-support)
> - [🙏 謝辞](#-acknowledgements)
> - [📄 ライセンス](#-license)

## 🤔 What is Spec-Driven Development?
> 🤔 Spec-Driven Developmentとは？

Spec-Driven Development **flips the script** on traditional software development. For decades, code has been king — specifications were just scaffolding we built and discarded once the "real work" of coding began. Spec-Driven Development changes this: **specifications become executable**, directly generating working implementations rather than just guiding them.
> Spec-Driven Developmentは従来のソフトウェア開発の常識を**覆す手法**です。長年にわたりコードこそが主役であり、仕様は「本番のコーディング」が始まると捨てられる足場に過ぎませんでした。Spec-Driven Developmentでは仕様が変わります。仕様そのものが**実行可能なアセット**となり、実装を導くのではなく、そのまま動作するソフトウェアを生成します。

## ⚡ Get Started
> ⚡ はじめに

### 1. Install Specify CLI
> 1. Specify CLIをインストールする

Choose your preferred installation method:
> 好みのインストール方法を選択してください。

#### Option 1: Persistent Installation (Recommended)
> オプション1：永続的なインストール（推奨）

Install once and use everywhere:
> 一度インストールすれば、どこでも利用できます。

```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
```

Then use the tool directly:
> その後はツールを直接利用できます。

```bash
specify init <PROJECT_NAME>
specify check
```

To upgrade specify run:
> specifyをアップグレードするには次を実行します。

```bash
uv tool install specify-cli --force --from git+https://github.com/github/spec-kit.git
```

#### Option 2: One-time Usage
> オプション2：単発での利用

Run directly without installing:
> インストールせずに直接実行します。

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

**Benefits of persistent installation:**
> **永続的にインストールする利点：**

- Tool stays installed and available in PATH
- No need to create shell aliases
- Better tool management with `uv tool list`, `uv tool upgrade`, `uv tool uninstall`
- Cleaner shell configuration
> - ツールがPATHに常駐するためいつでも利用可能
> - シェルエイリアスを作成する必要がない
> - `uv tool list`、`uv tool upgrade`、`uv tool uninstall`などでツール管理が容易
> - シェル設定をすっきり保てる

### 2. Establish project principles
> 2. プロジェクトの原則を定める

Use the **`/speckit.constitution`** command to create your project's governing principles and development guidelines that will guide all subsequent development.
> 後続の開発を導くプロジェクトの統治原則と開発ガイドラインを作成するには、**`/speckit.constitution`**コマンドを使用します。

```bash
/speckit.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements
```

### 3. Create the spec
> 3. 仕様を作成する

Use the **`/speckit.specify`** command to describe what you want to build. Focus on the **what** and **why**, not the tech stack.
> **何を**、そして**なぜ**構築するのかに集中し、技術スタックではなく目的を記述するために、**`/speckit.specify`**コマンドを使用してください。

```bash
/speckit.specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```

### 4. Create a technical implementation plan
> 4. 技術的な実装計画を作成する

Use the **`/speckit.plan`** command to provide your tech stack and architecture choices.
> 技術スタックとアーキテクチャの選択肢を提供するには、**`/speckit.plan`**コマンドを利用します。

```bash
/speckit.plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### 5. Break down into tasks
> 5. タスクに分割する

Use **`/speckit.tasks`** to create an actionable task list from your implementation plan.
> 実装計画から実行可能なタスクリストを生成するには、**`/speckit.tasks`**を実行します。

```bash
/speckit.tasks
```

### 6. Execute implementation
> 6. 実装を実行する

Use **`/speckit.implement`** to execute all tasks and build your feature according to the plan.
> すべてのタスクを実行し、計画に沿って機能を構築するには、**`/speckit.implement`**を使用します。

```bash
/speckit.implement
```

For detailed step-by-step instructions, see our [comprehensive guide](./spec-driven.md).
> 詳細な手順については[徹底ガイド](./spec-driven.md)を参照してください。

## 📽️ Video Overview
> 📽️ 動画概要

Want to see Spec Kit in action? Watch our [video overview](https://www.youtube.com/watch?v=a9eR1xsfvHg&pp=0gcJCckJAYcqIYzv)!
> Spec Kitの動作を確認したい場合は、[動画概要](https://www.youtube.com/watch?v=a9eR1xsfvHg&pp=0gcJCckJAYcqIYzv)をご覧ください。

[![Spec Kit video header](/media/spec-kit-video-header.jpg)](https://www.youtube.com/watch?v=a9eR1xsfvHg&pp=0gcJCckJAYcqIYzv)

## 🤖 Supported AI Agents
> 🤖 対応AIエージェント

| Agent                                                     | Support | Notes                                             |
|-----------------------------------------------------------|---------|---------------------------------------------------|
| [Claude Code](https://www.anthropic.com/claude-code)      | ✅ |                                                   |
| [GitHub Copilot](https://code.visualstudio.com/)          | ✅ |                                                   |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ |                                                   |
| [Cursor](https://cursor.sh/)                              | ✅ |                                                   |
| [Qwen Code](https://github.com/QwenLM/qwen-code)          | ✅ |                                                   |
| [opencode](https://opencode.ai/)                          | ✅ |                                                   |
| [Windsurf](https://windsurf.com/)                         | ✅ |                                                   |
| [Kilo Code](https://github.com/Kilo-Org/kilocode)         | ✅ |                                                   |
| [Auggie CLI](https://docs.augmentcode.com/cli/overview)   | ✅ |                                                   |
| [CodeBuddy CLI](https://www.codebuddy.ai/cli)             | ✅ |                                                   |
| [Roo Code](https://roocode.com/)                          | ✅ |                                                   |
| [Codex CLI](https://github.com/openai/codex)              | ✅ |                                                   |
| [Amazon Q Developer CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) | ⚠️ | Amazon Q Developer CLI [does not support](https://github.com/aws/amazon-q-developer-cli/issues/3064) custom arguments for slash commands. |
> | エージェント                                                     | サポート | 備考                                                     |
> |------------------------------------------------------------------|-----------|----------------------------------------------------------|
> | [Claude Code](https://www.anthropic.com/claude-code)             | ✅ |                                                          |
> | [GitHub Copilot](https://code.visualstudio.com/)                 | ✅ |                                                          |
> | [Gemini CLI](https://github.com/google-gemini/gemini-cli)        | ✅ |                                                          |
> | [Cursor](https://cursor.sh/)                                     | ✅ |                                                          |
> | [Qwen Code](https://github.com/QwenLM/qwen-code)                 | ✅ |                                                          |
> | [opencode](https://opencode.ai/)                                 | ✅ |                                                          |
> | [Windsurf](https://windsurf.com/)                                | ✅ |                                                          |
> | [Kilo Code](https://github.com/Kilo-Org/kilocode)                | ✅ |                                                          |
> | [Auggie CLI](https://docs.augmentcode.com/cli/overview)          | ✅ |                                                          |
> | [CodeBuddy CLI](https://www.codebuddy.ai/cli)                    | ✅ |                                                          |
> | [Roo Code](https://roocode.com/)                                 | ✅ |                                                          |
> | [Codex CLI](https://github.com/openai/codex)                     | ✅ |                                                          |
> | [Amazon Q Developer CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) | ⚠️ | Amazon Q Developer CLIはスラッシュコマンドでのカスタム引数を[サポートしていません](https://github.com/aws/amazon-q-developer-cli/issues/3064)。 |

## 🔧 Specify CLI Reference
> 🔧 Specify CLIリファレンス

The `specify` command supports the following options:
> `specify`コマンドは以下のオプションをサポートします。

### Commands
> コマンド

| Command     | Description                                                    |
|-------------|----------------------------------------------------------------|
| `init`      | Initialize a new Specify project from the latest template      |
| `check`     | Check for installed tools (`git`, `claude`, `gemini`, `code`/`code-insiders`, `cursor-agent`, `windsurf`, `qwen`, `opencode`, `codex`) |
> | コマンド   | 説明                                                                 |
> |------------|----------------------------------------------------------------------|
> | `init`     | 最新テンプレートから新しいSpecifyプロジェクトを初期化します           |
> | `check`    | インストール済みツール（`git`、`claude`、`gemini`、`code`/`code-insiders`、`cursor-agent`、`windsurf`、`qwen`、`opencode`、`codex`）を確認します |

### `specify init` Arguments & Options
> `specify init`の引数とオプション

| Argument/Option        | Type     | Description                                                                  |
|------------------------|----------|------------------------------------------------------------------------------|
| `<project-name>`       | Argument | Name for your new project directory (optional if using `--here`, or use `.` for current directory) |
| `--ai`                 | Option   | AI assistant to use: `claude`, `gemini`, `copilot`, `cursor-agent`, `qwen`, `opencode`, `codex`, `windsurf`, `kilocode`, `auggie`, `roo`, `codebuddy`, or `q` |
| `--script`             | Option   | Script variant to use: `sh` (bash/zsh) or `ps` (PowerShell)                 |
| `--ignore-agent-tools` | Flag     | Skip checks for AI agent tools like Claude Code                             |
| `--no-git`             | Flag     | Skip git repository initialization                                          |
| `--here`               | Flag     | Initialize project in the current directory instead of creating a new one   |
| `--force`              | Flag     | Force merge/overwrite when initializing in current directory (skip confirmation) |
| `--skip-tls`           | Flag     | Skip SSL/TLS verification (not recommended)                                 |
| `--debug`              | Flag     | Enable detailed debug output for troubleshooting                            |
| `--github-token`       | Option   | GitHub token for API requests (or set GH_TOKEN/GITHUB_TOKEN env variable)  |
> | 引数／オプション            | 種別     | 説明                                                                                                      |
> |-----------------------|----------|-----------------------------------------------------------------------------------------------------------|
> | `<project-name>`      | 引数     | 新しいプロジェクトディレクトリ名（`--here`を使う場合は任意。または`.`で現在のディレクトリを指定）                   |
> | `--ai`                | オプション | 使用するAIアシスタント：`claude`、`gemini`、`copilot`、`cursor-agent`、`qwen`、`opencode`、`codex`、`windsurf`、`kilocode`、`auggie`、`roo`、`codebuddy`、`q` |
> | `--script`            | オプション | 使用するスクリプトバリアント：`sh`（bash/zsh）または`ps`（PowerShell）                                     |
> | `--ignore-agent-tools`| フラグ   | Claude CodeなどのAIエージェントツールのチェックをスキップ                                                 |
> | `--no-git`            | フラグ   | gitリポジトリの初期化をスキップ                                                                            |
> | `--here`              | フラグ   | 新しいディレクトリを作成せず、現在のディレクトリで初期化                                                   |
> | `--force`             | フラグ   | 現在のディレクトリで初期化する際に確認なしで強制的にマージ／上書き                                         |
> | `--skip-tls`          | フラグ   | SSL/TLS検証をスキップ（非推奨）                                                                             |
> | `--debug`             | フラグ   | トラブルシューティング用に詳細なデバッグ出力を有効化                                                       |
> | `--github-token`      | オプション | GitHub APIリクエスト用のトークン（または環境変数GH_TOKEN／GITHUB_TOKENを設定）                             

### Examples
> 例

```bash
# Basic project initialization
specify init my-project

# Initialize with specific AI assistant
specify init my-project --ai claude

# Initialize with Cursor support
specify init my-project --ai cursor-agent

# Initialize with Windsurf support
specify init my-project --ai windsurf

# Initialize with PowerShell scripts (Windows/cross-platform)
specify init my-project --ai copilot --script ps

# Initialize in current directory
specify init . --ai copilot
# or use the --here flag
specify init --here --ai copilot

# Force merge into current (non-empty) directory without confirmation
specify init . --force --ai copilot
# or 
specify init --here --force --ai copilot

# Skip git initialization
specify init my-project --ai gemini --no-git

# Enable debug output for troubleshooting
specify init my-project --ai claude --debug

# Use GitHub token for API requests (helpful for corporate environments)
specify init my-project --ai claude --github-token ghp_your_token_here

# Check system requirements
specify check
```
> 上記の例では、基本的なプロジェクト初期化、特定のAIアシスタントの利用、カレントディレクトリでの初期化、強制マージ、git初期化のスキップ、デバッグ出力の有効化、GitHubトークンの指定、システム要件チェックまでを示しています。

### Available Slash Commands
> 利用可能なスラッシュコマンド

After running `specify init`, your AI coding agent will have access to these slash commands for structured development:
> `specify init`を実行すると、AIコーディングエージェントで構造化された開発を行うためのスラッシュコマンドが利用できるようになります。

#### Core Commands
> コアコマンド

Essential commands for the Spec-Driven Development workflow:
> Spec-Driven Developmentワークフローに不可欠なコマンド：

| Command                  | Description                                                           |
|--------------------------|-----------------------------------------------------------------------|
| `/speckit.constitution`  | Create or update project governing principles and development guidelines |
| `/speckit.specify`       | Define what you want to build (requirements and user stories)        |
| `/speckit.plan`          | Create technical implementation plans with your chosen tech stack     |
| `/speckit.tasks`         | Generate actionable task lists for implementation                     |
| `/speckit.implement`     | Execute all tasks to build the feature according to the plan         |
> | コマンド                    | 説明                                                                 |
> |-----------------------------|----------------------------------------------------------------------|
> | `/speckit.constitution`     | プロジェクトの統治原則と開発ガイドラインを作成または更新します         |
> | `/speckit.specify`          | 構築したい内容（要件やユーザーストーリー）を定義します               |
> | `/speckit.plan`             | 選択した技術スタックで技術的な実装計画を作成します                   |
> | `/speckit.tasks`            | 実装に向けた実行可能なタスクリストを生成します                       |
> | `/speckit.implement`        | 計画に沿ってすべてのタスクを実行し、機能を構築します                 |

#### Optional Commands
> 任意コマンド

Additional commands for enhanced quality and validation:
> 品質向上と検証を支援する追加コマンド：

| Command              | Description                                                           |
|----------------------|-----------------------------------------------------------------------|
| `/speckit.clarify`   | Clarify underspecified areas (recommended before `/speckit.plan`; formerly `/quizme`) |
| `/speckit.analyze`   | Cross-artifact consistency & coverage analysis (run after `/speckit.tasks`, before `/speckit.implement`) |
| `/speckit.checklist` | Generate custom quality checklists that validate requirements completeness, clarity, and consistency (like "unit tests for English") |
> | コマンド               | 説明                                                                                                   |
> |-----------------------|----------------------------------------------------------------------------------------------------------|
> | `/speckit.clarify`    | 記述が不足している箇所を明確化します（`/speckit.plan`の前に実行推奨。旧称`/quizme`）                     |
> | `/speckit.analyze`    | 成果物間の整合性とカバレッジを分析します（`/speckit.tasks`の後、`/speckit.implement`の前に実行）          |
> | `/speckit.checklist`  | 要件の網羅性・明確さ・整合性を検証するカスタム品質チェックリストを生成します（英語でのユニットテストのようなもの） |

### Environment Variables
> 環境変数

| Variable         | Description                                                                                    |
|------------------|------------------------------------------------------------------------------------------------|
| `SPECIFY_FEATURE` | Override feature detection for non-Git repositories. Set to the feature directory name (e.g., `001-photo-albums`) to work on a specific feature when not using Git branches.<br/>**Must be set in the context of the agent you're working with prior to using `/speckit.plan` or follow-up commands. |
> | 変数              | 説明                                                                                                                     |
> |-------------------|--------------------------------------------------------------------------------------------------------------------------|
> | `SPECIFY_FEATURE`  | Gitを使わないリポジトリでの機能検出を上書きします。特定の機能に取り組む際は機能ディレクトリ名（例：`001-photo-albums`）を設定してください。<br/>**`/speckit.plan`または後続のコマンドを利用する前に、作業中のエージェント環境で必ず設定する必要があります。 |

## 📚 Core Philosophy
> 📚 中核となる考え方

Spec-Driven Development is a structured process that emphasizes:
> Spec-Driven Developmentは次の点を重視する構造化されたプロセスです。

- **Intent-driven development** where specifications define the "_what_" before the "_how_"
- **Rich specification creation** using guardrails and organizational principles
- **Multi-step refinement** rather than one-shot code generation from prompts
- **Heavy reliance** on advanced AI model capabilities for specification interpretation
> - 仕様が「どのように」より先に「何を」定義する**意図駆動型の開発**
> - ガードレールや組織原則を活用した**豊かな仕様作成**
> - プロンプトからの一発生成ではなく**段階的な洗練プロセス**
> - 仕様解釈のために高度なAIモデル能力へ**大きく依存**

## 🌟 Development Phases
> 🌟 開発フェーズ

| Phase | Focus | Key Activities |
|-------|-------|----------------|
| **0-to-1 Development** ("Greenfield") | Generate from scratch | <ul><li>Start with high-level requirements</li><li>Generate specifications</li><li>Plan implementation steps</li><li>Build production-ready applications</li></ul> |
| **Creative Exploration** | Parallel implementations | <ul><li>Explore diverse solutions</li><li>Support multiple technology stacks & architectures</li><li>Experiment with UX patterns</li></ul> |
| **Iterative Enhancement** ("Brownfield") | Brownfield modernization | <ul><li>Add features iteratively</li><li>Modernize legacy systems</li><li>Adapt processes</li></ul> |
> | フェーズ | フォーカス | 主な活動 |
> |---------|-----------|----------------|
> | **0-to-1開発**（グリーンフィールド） | ゼロから生成 | <ul><li>高レベル要件から着手</li><li>仕様を生成</li><li>実装ステップを計画</li><li>本番投入可能なアプリケーションを構築</li></ul> |
> | **創造的探査** | 並行実装 | <ul><li>多様な解決策を探索</li><li>複数の技術スタックとアーキテクチャを支援</li><li>UXパターンを試行</li></ul> |
> | **反復的改善**（ブラウンフィールド） | 既存モダナイズ | <ul><li>機能を段階的に追加</li><li>レガシーシステムをモダナイズ</li><li>プロセスを適応</li></ul> |

## 🎯 Experimental Goals
> 🎯 実験的な目標

Our research and experimentation focus on:
> 本プロジェクトの研究・実験は以下に焦点を当てています。

### Technology independence
> 技術スタックからの独立性

- Create applications using diverse technology stacks
- Validate the hypothesis that Spec-Driven Development is a process not tied to specific technologies, programming languages, or frameworks
> - 多様な技術スタックを用いたアプリケーションを構築
> - Spec-Driven Developmentが特定の技術・言語・フレームワークに依存しないプロセスであるという仮説を検証

### Enterprise constraints
> エンタープライズ制約

- Demonstrate mission-critical application development
- Incorporate organizational constraints (cloud providers, tech stacks, engineering practices)
- Support enterprise design systems and compliance requirements
> - ミッションクリティカルなアプリケーション開発を実証
> - 組織の制約（クラウド提供者、技術スタック、開発慣行）を取り込む
> - エンタープライズ向けデザインシステムとコンプライアンス要件をサポート

### User-centric development
> ユーザー中心の開発

- Build applications for different user cohorts and preferences
- Support various development approaches (from vibe-coding to AI-native development)
> - 様々なユーザー層と嗜好に合わせたアプリケーションを構築
> - 手探りの開発からAIネイティブな開発まで、多様なアプローチを支援

### Creative & iterative processes
> 創造的かつ反復的なプロセス

- Validate the concept of parallel implementation exploration
- Provide robust iterative feature development workflows
- Extend processes to handle upgrades and modernization tasks
> - 並行実装探索というコンセプトを検証
> - 強固な反復的機能開発ワークフローを提供
> - アップグレードやモダナイゼーションを扱えるプロセスへ拡張

## 🔧 Prerequisites
> 🔧 前提条件

- **Linux/macOS/Windows**
- [Supported](#-supported-ai-agents) AI coding agent.
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
> - **Linux／macOS／Windows**
> - [対応AIエージェント](#-supported-ai-agents)
> - パッケージ管理用の[uv](https://docs.astral.sh/uv/)
> - [Python 3.11+](https://www.python.org/downloads/)
> - [Git](https://git-scm.com/downloads)

If you encounter issues with an agent, please open an issue so we can refine the integration.
> エージェントで問題が発生した場合はIssueを作成していただければ、統合改善の参考にします。

## 📖 Learn More
> 📖 さらに学ぶ

- **[Complete Spec-Driven Development Methodology](./spec-driven.md)** - Deep dive into the full process
- **[Detailed Walkthrough](#-detailed-process)** - Step-by-step implementation guide
> - **[Spec-Driven Developmentの完全な手法](./spec-driven.md)** — プロセス全体を詳説
> - **[詳細なウォークスルー](#-detailed-process)** — 手順を追った実装ガイド

---

## 📋 Detailed Process
> 📋 詳細なプロセス

<details>
<summary>Click to expand the detailed step-by-step walkthrough<br/>詳細なステップバイステップの解説を表示</summary>

You can use the Specify CLI to bootstrap your project, which will bring in the required artifacts in your environment. Run:
> Specify CLIを使用すると、必要な成果物を環境に取り込みながらプロジェクトをブートストラップできます。次を実行してください。

```bash
specify init <project_name>
```

Or initialize in the current directory:
> もしくは現在のディレクトリで初期化します。

```bash
specify init .
# or use the --here flag
specify init --here
# Skip confirmation when the directory already has files
specify init . --force
# or
specify init --here --force
```

![Specify CLI bootstrapping a new project in the terminal](./media/specify_cli.gif)

You will be prompted to select the AI agent you are using. You can also proactively specify it directly in the terminal:
> 利用するAIエージェントを選択するよう求められます。端末で事前に指定することも可能です。

```bash
specify init <project_name> --ai claude
specify init <project_name> --ai gemini
specify init <project_name> --ai copilot

# Or in current directory:
specify init . --ai claude
specify init . --ai codex

# or use --here flag
specify init --here --ai claude
specify init --here --ai codex

# Force merge into a non-empty current directory
specify init . --force --ai claude

# or
specify init --here --force --ai claude
```

The CLI will check if you have Claude Code, Gemini CLI, Cursor CLI, Qwen CLI, opencode, Codex CLI, or Amazon Q Developer CLI installed. If you do not, or you prefer to get the templates without checking for the right tools, use `--ignore-agent-tools` with your command:
> CLIはClaude Code、Gemini CLI、Cursor CLI、Qwen CLI、opencode、Codex CLI、Amazon Q Developer CLIがインストールされているか確認します。未インストールでもテンプレートだけ取得したい場合は、コマンドに`--ignore-agent-tools`を付けてください。

```bash
specify init <project_name> --ai claude --ignore-agent-tools
```

### **STEP 1:** Establish project principles
> **STEP 1：** プロジェクト原則を確立する

Go to the project folder and run your AI agent. In our example, we're using `claude`.
> プロジェクトフォルダーでAIエージェントを起動します。この例では`claude`を使用しています。

![Bootstrapping Claude Code environment](./media/bootstrap-claude-code.gif)

You will know that things are configured correctly if you see the `/speckit.constitution`, `/speckit.specify`, `/speckit.plan`, `/speckit.tasks`, and `/speckit.implement` commands available.
> `/speckit.constitution`、`/speckit.specify`、`/speckit.plan`、`/speckit.tasks`、`/speckit.implement`の各コマンドが表示されていれば、正しく設定できています。

The first step should be establishing your project's governing principles using the `/speckit.constitution` command. This helps ensure consistent decision-making throughout all subsequent development phases:
> 最初のステップは、`/speckit.constitution`コマンドでプロジェクトの統治原則を定めることです。これにより、以降の開発フェーズで一貫した意思決定が行えます。

```text
/speckit.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements. Include governance for how these principles should guide technical decisions and implementation choices.
```

This step creates or updates the `.specify/memory/constitution.md` file with your project's foundational guidelines that the AI agent will reference during specification, planning, and implementation phases.
> このステップにより、仕様作成・計画・実装の各フェーズでAIエージェントが参照する基盤ガイドラインとして`.specify/memory/constitution.md`が作成または更新されます。

### **STEP 2:** Create project specifications
> **STEP 2：** プロジェクト仕様を作成する

With your project principles established, you can now create the functional specifications. Use the `/speckit.specify` command and then provide the concrete requirements for the project you want to develop.
> 原則が整ったら、機能仕様を作成します。`/speckit.specify`コマンドを実行し、開発したいプロジェクトの具体的な要件を入力してください。

>[!IMPORTANT]
>Be as explicit as possible about _what_ you are trying to build and _why_. **Do not focus on the tech stack at this point**.
> [!IMPORTANT]
> 何をなぜ作るのかをできるだけ明確に記述してください。**この段階では技術スタックに焦点を当てないでください。**

An example prompt:
> 例となるプロンプト：

```text
Develop Taskify, a team productivity platform. It should allow users to create projects, add team members,
assign tasks, comment and move tasks between boards in Kanban style. In this initial phase for this feature,
let's call it "Create Taskify," let's have multiple users but the users will be declared ahead of time, predefined.
I want five users in two different categories, one product manager and four engineers. Let's create three
different sample projects. Let's have the standard Kanban columns for the status of each task, such as "To Do,"
"In Progress," "In Review," and "Done." There will be no login for this application as this is just the very
first testing thing to ensure that our basic features are set up. For each task in the UI for a task card,
you should be able to change the current status of the task between the different columns in the Kanban work board.
You should be able to leave an unlimited number of comments for a particular card. You should be able to, from that task
card, assign one of the valid users. When you first launch Taskify, it's going to give you a list of the five users to pick
from. There will be no password required. When you click on a user, you go into the main view, which displays the list of
projects. When you click on a project, you open the Kanban board for that project. You're going to see the columns.
You'll be able to drag and drop cards back and forth between different columns. You will see any cards that are
assigned to you, the currently logged in user, in a different color from all the other ones, so you can quickly
see yours. You can edit any comments that you make, but you can't edit comments that other people made. You can
delete any comments that you made, but you can't delete comments anybody else made.
```

After this prompt is entered, you should see Claude Code kick off the planning and spec drafting process. Claude Code will also trigger some of the built-in scripts to set up the repository.
> このプロンプトを入力すると、Claude Codeが計画と仕様作成プロセスを開始し、リポジトリを設定するための組み込みスクリプトも実行されます。

Once this step is completed, you should have a new branch created (e.g., `001-create-taskify`), as well as a new specification in the `specs/001-create-taskify` directory.
> このステップが完了すると、新しいブランチ（例：`001-create-taskify`）と、`specs/001-create-taskify`ディレクトリ内に新しい仕様が生成されているはずです。

The produced specification should contain a set of user stories and functional requirements, as defined in the template.
> 生成された仕様には、テンプレートで定義されているユーザーストーリーと機能要件が含まれます。

At this stage, your project folder contents should resemble the following:
> この段階で、プロジェクトフォルダーは次のような構成になっているはずです。

```text
└── .specify
    ├── memory
    │	 └── constitution.md
    ├── scripts
    │	 ├── check-prerequisites.sh
    │	 ├── common.sh
    │	 ├── create-new-feature.sh
    │	 ├── setup-plan.sh
    │	 └── update-claude-md.sh
    ├── specs
    │	 └── 001-create-taskify
    │	     └── spec.md
    └── templates
        ├── plan-template.md
        ├── spec-template.md
        └── tasks-template.md
```

### **STEP 3:** Functional specification clarification (required before planning)
> **STEP 3：** 機能仕様の明確化（計画前に必須）

With the baseline specification created, you can go ahead and clarify any of the requirements that were not captured properly within the first shot attempt.
> ベースとなる仕様ができたら、初回で十分に反映されなかった要件を明確化しましょう。

You should run the structured clarification workflow **before** creating a technical plan to reduce rework downstream.
> 下流での手戻りを減らすため、技術計画を作成する**前に**構造化された明確化ワークフローを実行することを推奨します。

Preferred order:
> 推奨手順：

1. Use `/speckit.clarify` (structured) – sequential, coverage-based questioning that records answers in a Clarifications section.
2. Optionally follow up with ad-hoc free-form refinement if something still feels vague.
> 1. `/speckit.clarify`（構造化）を使用 — 連続的かつ網羅的な質問で、Clarificationsセクションに回答を記録します。  
> 2. まだ曖昧さが残る場合は、必要に応じて自由形式で追加の精査を行います。

If you intentionally want to skip clarification (e.g., spike or exploratory prototype), explicitly state that so the agent doesn't block on missing clarifications.
> 明確化を意図的にスキップしたい場合（例：スパイク、探索的プロトタイプ）、不足を理由にエージェントが停止しないよう、明確に伝えてください。

Example free-form refinement prompt (after `/speckit.clarify` if still needed):
> 自由形式での追加精査の例（必要であれば`/speckit.clarify`の後に実施）：

```text
For each sample project or project that you create there should be a variable number of tasks between 5 and 15
tasks for each one randomly distributed into different states of completion. Make sure that there's at least
one task in each stage of completion.
```

You should also ask Claude Code to validate the **Review & Acceptance Checklist**, checking off the things that are validated/pass the requirements, and leave the ones that are not unchecked. The following prompt can be used:
> また、Claude Codeに**Review & Acceptance Checklist**の検証を依頼し、要件を満たす項目にチェックを入れ、満たさない項目は未チェックのままにするよう指示してください。以下のプロンプトが利用できます。

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

It's important to use the interaction with Claude Code as an opportunity to clarify and ask questions around the specification - **do not treat its first attempt as final**.
> Claude Codeとの対話は仕様を明確化し疑問を解消する好機です。**最初の出力を最終版として扱わないでください。**

### **STEP 4:** Generate a plan
> **STEP 4：** 計画を生成する

You can now be specific about the tech stack and other technical requirements. You can use the `/speckit.plan` command that is built into the project template with a prompt like this:
> 技術スタックやその他の技術要件を具体化しましょう。プロジェクトテンプレートに組み込まれている`/speckit.plan`コマンドを、以下のようなプロンプトで使用できます。

```text
We are going to generate this using .NET Aspire, using Postgres as the database. The frontend should use
Blazor server with drag-and-drop task boards, real-time updates. There should be a REST API created with a projects API,
tasks API, and a notifications API.
```

The output of this step will include a number of implementation detail documents, with your directory tree resembling this:
> このステップの出力には複数の実装詳細ドキュメントが含まれ、ディレクトリ構成は次のようになります。

```text
.
├── CLAUDE.md
├── memory
│	 └── constitution.md
├── scripts
│	 ├── check-prerequisites.sh
│	 ├── common.sh
│	 ├── create-new-feature.sh
│	 ├── setup-plan.sh
│	 └── update-claude-md.sh
├── specs
│	 └── 001-create-taskify
│	     ├── contracts
│	     │	 ├── api-spec.json
│	     │	 └── signalr-spec.md
│	     ├── data-model.md
│	     ├── plan.md
│	     ├── quickstart.md
│	     ├── research.md
│	     └── spec.md
└── templates
    ├── CLAUDE-template.md
    ├── plan-template.md
    ├── spec-template.md
    └── tasks-template.md
```

Check the `research.md` document to ensure that the right tech stack is used, based on your instructions. You can ask Claude Code to refine it if any of the components stand out, or even have it check the locally-installed version of the platform/framework you want to use (e.g., .NET).
> 指示に基づいて正しい技術スタックが選択されているかを確認するために、`research.md`ドキュメントをチェックしてください。気になる要素があればClaude Codeに改訂を依頼したり、使用したいプラットフォームやフレームワークのローカルインストール版（例：.NET）を確認させることもできます。

Additionally, you might want to ask Claude Code to research details about the chosen tech stack if it's something that is rapidly changing (e.g., .NET Aspire, JS frameworks), with a prompt like this:
> 選択した技術スタックが急速に変化している場合（例：.NET Aspire、各種JSフレームワーク）、次のようなプロンプトでClaude Codeに追加調査を依頼すると良いでしょう。

```text
I want you to go through the implementation plan and implementation details, looking for areas that could
benefit from additional research as .NET Aspire is a rapidly changing library. For those areas that you identify that
require further research, I want you to update the research document with additional details about the specific
versions that we are going to be using in this Taskify application and spawn parallel research tasks to clarify
any details using research from the web.
```

During this process, you might find that Claude Code gets stuck researching the wrong thing - you can help nudge it in the right direction with a prompt like this:
> この過程で、Claude Codeが的外れな調査に陥ることがあります。その場合は、次のようなプロンプトで正しい方向へ軌道修正しましょう。

```text
I think we need to break this down into a series of steps. First, identify a list of tasks
that you would need to do during implementation that you're not sure of or would benefit
from further research. Write down a list of those tasks. And then for each one of these tasks,
I want you to spin up a separate research task so that the net results is we are researching
all of those very specific tasks in parallel. What I saw you doing was it looks like you were
researching .NET Aspire in general and I don't think that's gonna do much for us in this case.
That's way too untargeted research. The research needs to help you solve a specific targeted question.
```

>[!NOTE]
>Claude Code might be over-eager and add components that you did not ask for. Ask it to clarify the rationale and the source of the change.
> [!NOTE]
> Claude Codeは熱心になりすぎて依頼していないコンポーネントを追加することがあります。変更の理由と根拠を必ず確認してください。

### **STEP 5:** Have Claude Code validate the plan
> **STEP 5：** Claude Codeに計画を検証させる

With the plan in place, you should have Claude Code run through it to make sure that there are no missing pieces. You can use a prompt like this:
> 計画が整ったら、欠落がないかClaude Codeに確認させましょう。以下のようなプロンプトを使用できます。

```text
Now I want you to go and audit the implementation plan and the implementation detail files.
Read through it with an eye on determining whether or not there is a sequence of tasks that you need
to be doing that are obvious from reading this. Because I don't know if there's enough here. For example,
when I look at the core implementation, it would be useful to reference the appropriate places in the implementation
details where it can find the information as it walks through each step in the core implementation or in the refinement.
```

This helps refine the implementation plan and helps you avoid potential blind spots that Claude Code missed in its planning cycle. Once the initial refinement pass is complete, ask Claude Code to go through the checklist once more before you can get to the implementation.
> これにより、実装計画をさらに洗練し、計画段階でClaude Codeが見落とした盲点を回避できます。初回の見直しが完了したら、実装に進む前にチェックリストを再確認するよう依頼してください。

You can also ask Claude Code (if you have the [GitHub CLI](https://docs.github.com/en/github-cli/github-cli) installed) to go ahead and create a pull request from your current branch to `main` with a detailed description, to make sure that the effort is properly tracked.
> [GitHub CLI](https://docs.github.com/en/github-cli/github-cli)をインストールしている場合は、現在のブランチから`main`へのプルリクエストを詳細な説明付きで作成するようClaude Codeに指示し、作業が適切に追跡されるようにできます。

>[!NOTE]
>Before you have the agent implement it, it's also worth prompting Claude Code to cross-check the details to see if there are any over-engineered pieces (remember - it can be over-eager). If over-engineered components or decisions exist, you can ask Claude Code to resolve them. Ensure that Claude Code follows the [constitution](base/memory/constitution.md) as the foundational piece that it must adhere to when establishing the plan.
> [!NOTE]
> 実装に入る前に、過剰設計がないか詳細をクロスチェックするようClaude Codeに促すと効果的です（熱心になりすぎることがあります）。過剰なコンポーネントや決定が見つかった場合は是正を依頼し、計画策定時に[憲法](base/memory/constitution.md)を必ず順守させてください。

### **STEP 6:** Generate task breakdown with /speckit.tasks
> **STEP 6：** `/speckit.tasks`でタスク分解を生成する

With the implementation plan validated, you can now break down the plan into specific, actionable tasks that can be executed in the correct order. Use the `/speckit.tasks` command to automatically generate a detailed task breakdown from your implementation plan:
> 実装計画が検証できたら、順序立てて実行できる具体的なタスクへ分解します。`/speckit.tasks`コマンドを使えば、実装計画から詳細なタスク分解を自動生成できます。

```text
/speckit.tasks
```

This step creates a `tasks.md` file in your feature specification directory that contains:
> このステップにより、機能仕様ディレクトリに`tasks.md`ファイルが生成され、以下を含みます。

- **Task breakdown organized by user story** - Each user story becomes a separate implementation phase with its own set of tasks
- **Dependency management** - Tasks are ordered to respect dependencies between components (e.g., models before services, services before endpoints)
- **Parallel execution markers** - Tasks that can run in parallel are marked with `[P]` to optimize development workflow
- **File path specifications** - Each task includes the exact file paths where implementation should occur
- **Test-driven development structure** - If tests are requested, test tasks are included and ordered to be written before implementation
- **Checkpoint validation** - Each user story phase includes checkpoints to validate independent functionality
> - **ユーザーストーリーごとのタスク分解** — 各ユーザーストーリーが独立した実装フェーズとなり、固有のタスクセットが割り当てられます
> - **依存関係管理** — コンポーネントの依存関係（例：サービスの前にモデル、エンドポイントの前にサービス）を尊重した順序で並べられます
> - **並列実行マーカー** — 並行実行できるタスクには`[P]`が付与され、開発フローを最適化します
> - **ファイルパス指定** — 各タスクに実装対象となる正確なファイルパスが含まれます
> - **テスト駆動の構造** — テストが要求される場合、実装前にテストタスクが含まれ順序付けられます
> - **チェックポイント検証** — 各ユーザーストーリーフェーズに独立した機能を検証するチェックポイントが含まれます

The generated tasks.md provides a clear roadmap for the `/speckit.implement` command, ensuring systematic implementation that maintains code quality and allows for incremental delivery of user stories.
> 生成された`tasks.md`は`/speckit.implement`コマンドの明確なロードマップとなり、コード品質を維持しつつユーザーストーリーを段階的に提供できる体系的な実装を保証します。

### **STEP 7:** Implementation
> **STEP 7：** 実装

Once ready, use the `/speckit.implement` command to execute your implementation plan:
> 準備が整ったら、`/speckit.implement`コマンドで実装計画を実行します。

```text
/speckit.implement
```

The `/speckit.implement` command will:
- Validate that all prerequisites are in place (constitution, spec, plan, and tasks)
- Parse the task breakdown from `tasks.md`
- Execute tasks in the correct order, respecting dependencies and parallel execution markers
- Follow the TDD approach defined in your task plan
- Provide progress updates and handle errors appropriately
> `/speckit.implement`コマンドは以下を行います：
> - すべての前提条件（憲法、仕様、計画、タスク）が揃っているか検証
> - `tasks.md`からタスク分解を読み込む
> - 依存関係と並列実行マーカーを尊重して正しい順序でタスクを実行
> - タスクプランで定義されたTDDアプローチに従う
> - 進捗更新を提供し、エラーを適切に処理

>[!IMPORTANT]
>The AI agent will execute local CLI commands (such as `dotnet`, `npm`, etc.) - make sure you have the required tools installed on your machine.
> [!IMPORTANT]
> AIエージェントは`dotnet`や`npm`などのローカルCLIコマンドを実行します。必要なツールがローカルにインストールされていることを確認してください。

Once the implementation is complete, test the application and resolve any runtime errors that may not be visible in CLI logs (e.g., browser console errors). You can copy and paste such errors back to your AI agent for resolution.
> 実装が完了したら、アプリケーションをテストし、CLIログではわからないランタイムエラー（例：ブラウザコンソールのエラー）を解消してください。エラーをコピーしてAIエージェントに渡せば、対応策を提案してくれます。

</details>

---

## 🔍 Troubleshooting
> 🔍 トラブルシューティング

### Git Credential Manager on Linux
> LinuxでのGit Credential Manager

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:
> LinuxでGit認証に問題がある場合は、Git Credential Managerをインストールしてください。

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

## 👥 Maintainers
> 👥 メンテナー

- Den Delimarsky ([@localden](https://github.com/localden))
- John Lam ([@jflam](https://github.com/jflam))
> - Den Delimarsky（[@localden](https://github.com/localden))
> - John Lam（[@jflam](https://github.com/jflam))

## 💬 Support
> 💬 サポート

For support, please open a [GitHub issue](https://github.com/github/spec-kit/issues/new). We welcome bug reports, feature requests, and questions about using Spec-Driven Development.
> サポートが必要な場合は[GitHub Issue](https://github.com/github/spec-kit/issues/new)を作成してください。バグ報告、機能要望、Spec-Driven Developmentの活用に関する質問を歓迎します。

## 🙏 Acknowledgements
> 🙏 謝辞

This project is heavily influenced by and based on the work and research of [John Lam](https://github.com/jflam).
> 本プロジェクトは[John Lam](https://github.com/jflam)の研究と成果に大きな影響を受けています。

## 📄 License
> 📄 ライセンス

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
> 本プロジェクトはMITオープンソースライセンスの条件で提供されています。詳細は[LICENSE](./LICENSE)をご確認ください。
