# AGENTS.md
> AGENTS.md ドキュメント

## About Spec Kit and Specify
> Spec KitとSpecifyについて

**GitHub Spec Kit** is a comprehensive toolkit for implementing Spec-Driven Development (SDD) - a methodology that emphasizes creating clear specifications before implementation. The toolkit includes templates, scripts, and workflows that guide development teams through a structured approach to building software.
> **GitHub Spec Kit**は、実装前に明確な仕様を作成することを重視するSpec-Driven Development（SDD）を実践するための包括的なツールキットです。このツールキットにはテンプレート、スクリプト、ワークフローが含まれており、開発チームが構造化されたアプローチでソフトウェアを構築できるよう支援します。

**Specify CLI** is the command-line interface that bootstraps projects with the Spec Kit framework. It sets up the necessary directory structures, templates, and AI agent integrations to support the Spec-Driven Development workflow.
> **Specify CLI**は、Spec Kitフレームワークでプロジェクトをブートストラップするコマンドラインインターフェイスです。Spec-Driven Developmentのワークフローを支えるために、必要なディレクトリ構造、テンプレート、AIエージェント統合を整備します。

The toolkit supports multiple AI coding assistants, allowing teams to use their preferred tools while maintaining consistent project structure and development practices.
> このツールキットは複数のAIコーディングアシスタントをサポートしており、チームが好みのツールを活用しつつ、統一されたプロジェクト構造と開発手法を維持できます。

---
> ---

## General practices
> 一般的な運用

- Any changes to `__init__.py` for the Specify CLI require a version rev in `pyproject.toml` and addition of entries to `CHANGELOG.md`.
> Specify CLIの`__init__.py`を変更する場合は、`pyproject.toml`でバージョンを更新し、`CHANGELOG.md`に項目を追加する必要があります。

## Adding New Agent Support
> 新しいエージェントサポートの追加

This section explains how to add support for new AI agents/assistants to the Specify CLI. Use this guide as a reference when integrating new AI tools into the Spec-Driven Development workflow.
> このセクションでは、新しいAIエージェントやアシスタントをSpecify CLIに追加する方法を説明します。Spec-Driven Developmentのワークフローに新しいAIツールを統合する際の参考として活用してください。

### Overview
> 概要

Specify supports multiple AI agents by generating agent-specific command files and directory structures when initializing projects. Each agent has its own conventions for:
> Specifyは、プロジェクト初期化時にエージェント固有のコマンドファイルとディレクトリ構造を生成することで複数のAIエージェントをサポートします。各エージェントには次のような固有の慣習があります。

- **Command file formats** (Markdown, TOML, etc.)
> **コマンドファイル形式**（Markdown、TOMLなど）
- **Directory structures** (`.claude/commands/`, `.windsurf/workflows/`, etc.)
> **ディレクトリ構造**（`.claude/commands/`、`.windsurf/workflows/`など）
- **Command invocation patterns** (slash commands, CLI tools, etc.)
> **コマンドの呼び出しパターン**（スラッシュコマンド、CLIツールなど）
- **Argument passing conventions** (`$ARGUMENTS`, `{{args}}`, etc.)
> **引数の渡し方の慣習**（`$ARGUMENTS`、`{{args}}`など）

### Current Supported Agents
> 現在サポートされているエージェント

| Agent | Directory | Format | CLI Tool | Description |
|-------|-----------|---------|----------|-------------|
| **Claude Code** | `.claude/commands/` | Markdown | `claude` | Anthropic's Claude Code CLI |
| **Gemini CLI** | `.gemini/commands/` | TOML | `gemini` | Google's Gemini CLI |
| **GitHub Copilot** | `.github/prompts/` | Markdown | N/A (IDE-based) | GitHub Copilot in VS Code |
| **Cursor** | `.cursor/commands/` | Markdown | `cursor-agent` | Cursor CLI |
| **Qwen Code** | `.qwen/commands/` | TOML | `qwen` | Alibaba's Qwen Code CLI |
| **opencode** | `.opencode/command/` | Markdown | `opencode` | opencode CLI |
| **Codex CLI** | `.codex/commands/` | Markdown | `codex` | Codex CLI |
| **Windsurf** | `.windsurf/workflows/` | Markdown | N/A (IDE-based) | Windsurf IDE workflows |
| **Kilo Code** | `.kilocode/rules/` | Markdown | N/A (IDE-based) | Kilo Code IDE |
| **Auggie CLI** | `.augment/rules/` | Markdown | `auggie` | Auggie CLI |
| **Roo Code** | `.roo/rules/` | Markdown | N/A (IDE-based) | Roo Code IDE |
| **CodeBuddy CLI** | `.codebuddy/commands/` | Markdown | `codebuddy` | CodeBuddy CLI |
| **Amazon Q Developer CLI** | `.amazonq/prompts/` | Markdown | `q` | Amazon Q Developer CLI |
> 上記の表は、Specifyが生成するエージェント固有のディレクトリ、フォーマット、CLIツール、および説明を示しています。

| エージェント | ディレクトリ | 形式 | CLIツール | 説明 |
|-------------|--------------|------|-----------|------|
| **Claude Code** | `.claude/commands/` | Markdown | `claude` | AnthropicのClaude Code CLI |
| **Gemini CLI** | `.gemini/commands/` | TOML | `gemini` | GoogleのGemini CLI |
| **GitHub Copilot** | `.github/prompts/` | Markdown | N/A（IDEベース） | VS Code向けGitHub Copilot |
| **Cursor** | `.cursor/commands/` | Markdown | `cursor-agent` | Cursor CLI |
| **Qwen Code** | `.qwen/commands/` | TOML | `qwen` | AlibabaのQwen Code CLI |
| **opencode** | `.opencode/command/` | Markdown | `opencode` | opencode CLI |
| **Codex CLI** | `.codex/commands/` | Markdown | `codex` | Codex CLI |
| **Windsurf** | `.windsurf/workflows/` | Markdown | N/A（IDEベース） | Windsurf IDEのワークフロー |
| **Kilo Code** | `.kilocode/rules/` | Markdown | N/A（IDEベース） | Kilo Code IDE |
| **Auggie CLI** | `.augment/rules/` | Markdown | `auggie` | Auggie CLI |
| **Roo Code** | `.roo/rules/` | Markdown | N/A（IDEベース） | Roo Code IDE |
| **CodeBuddy CLI** | `.codebuddy/commands/` | Markdown | `codebuddy` | CodeBuddy CLI |
| **Amazon Q Developer CLI** | `.amazonq/prompts/` | Markdown | `q` | Amazon Q Developer CLI |

### Step-by-Step Integration Guide
> 手順に沿った統合ガイド

Follow these steps to add a new agent (using a hypothetical new agent as an example):
> 仮想的な新規エージェントを例に、次の手順で新しいエージェントを追加してください。

#### 1. Add to AGENT_CONFIG
> 1. AGENT_CONFIGに追加する

**IMPORTANT**: Use the actual CLI tool name as the key, not a shortened version.
> **重要**: 省略形ではなく、実際のCLIツール名をキーとして使用してください。

Add the new agent to the `AGENT_CONFIG` dictionary in `src/specify_cli/__init__.py`. This is the **single source of truth** for all agent metadata:
> 新しいエージェントを`src/specify_cli/__init__.py`内の`AGENT_CONFIG`辞書に追加します。ここがすべてのエージェントメタデータの**唯一の信頼できる情報源**です。

```python
AGENT_CONFIG = {
    # ... existing agents ...
    "new-agent-cli": {  # Use the ACTUAL CLI tool name (what users type in terminal)
        "name": "New Agent Display Name",
        "folder": ".newagent/",  # Directory for agent files
        "install_url": "https://example.com/install",  # URL for installation docs (or None if IDE-based)
        "requires_cli": True,  # True if CLI tool required, False for IDE-based agents
    },
}
```

**Key Design Principle**: The dictionary key should match the actual executable name that users install. For example:
> **主要な設計原則**: 辞書のキーは、ユーザーがインストールする実際の実行ファイル名と一致する必要があります。たとえば次のとおりです。

- ✅ Use `"cursor-agent"` because the CLI tool is literally called `cursor-agent`
> ✅ CLIツール名が`cursor-agent`なので、`"cursor-agent"`を使用します。
- ❌ Don't use `"cursor"` as a shortcut if the tool is `cursor-agent`
> ❌ ツールが`cursor-agent`である場合、短縮形の`"cursor"`は使用しないでください。

This eliminates the need for special-case mappings throughout the codebase.
> これにより、コードベース全体で特別なマッピングを行う必要がなくなります。

**Field Explanations**:
> **各フィールドの説明**:

- `name`: Human-readable display name shown to users
> `name`: ユーザーに表示される判読しやすい表示名
- `folder`: Directory where agent-specific files are stored (relative to project root)
> `folder`: エージェント固有のファイルを格納するディレクトリ（プロジェクトルートからの相対パス）
- `install_url`: Installation documentation URL (set to `None` for IDE-based agents)
> `install_url`: インストール手順へのURL（IDEベースのエージェントでは`None`）
- `requires_cli`: Whether the agent requires a CLI tool check during initialization
> `requires_cli`: 初期化時にCLIツールのチェックが必要かどうか

#### 2. Update CLI Help Text
> 2. CLIのヘルプテキストを更新する

Update the `--ai` parameter help text in the `init()` command to include the new agent:
> `init()`コマンドの`--ai`パラメータのヘルプテキストを更新し、新しいエージェントを含めます。

```python
ai_assistant: str = typer.Option(None, "--ai", help="AI assistant to use: claude, gemini, copilot, cursor-agent, qwen, opencode, codex, windsurf, kilocode, auggie, codebuddy, new-agent-cli, or q"),
```

Also update any function docstrings, examples, and error messages that list available agents.
> 利用可能なエージェントを列挙している関数のドキュメンテーション文字列、例、エラーメッセージも更新してください。

#### 3. Update README Documentation
> 3. READMEドキュメントを更新する

Update the **Supported AI Agents** section in `README.md` to include the new agent:
> `README.md`の**Supported AI Agents**セクションを更新し、新しいエージェントを追加します。

- Add the new agent to the table with appropriate support level (Full/Partial)
> 対応状況（Full/Partial）を含めて新しいエージェントを表に追加します。
- Include the agent's official website link
> エージェントの公式ウェブサイトへのリンクを掲載します。
- Add any relevant notes about the agent's implementation
> エージェントの実装に関する注意事項を追加します。
- Ensure the table formatting remains aligned and consistent
> 表の整列と一貫性を保ってください。

#### 4. Update Release Package Script
> 4. リリースパッケージスクリプトを更新する

Modify `.github/workflows/scripts/create-release-packages.sh`:
> `.github/workflows/scripts/create-release-packages.sh`を修正します。

##### Add to ALL_AGENTS array:
> ALL_AGENTS配列に追加する:

```bash
ALL_AGENTS=(claude gemini copilot cursor-agent qwen opencode windsurf q)
```

##### Add case statement for directory structure:
> ディレクトリ構造用のcase文を追加する:

```bash
case $agent in
  # ... existing cases ...
  windsurf)
    mkdir -p "$base_dir/.windsurf/workflows"
    generate_commands windsurf md "\$ARGUMENTS" "$base_dir/.windsurf/workflows" "$script" ;;
esac
```

#### 4. Update GitHub Release Script
> 4. GitHubリリーススクリプトを更新する

Modify `.github/workflows/scripts/create-github-release.sh` to include the new agent's packages:
> `.github/workflows/scripts/create-github-release.sh`を更新し、新しいエージェントのパッケージを含めます。

```bash
gh release create "$VERSION" \
  # ... existing packages ...
  .genreleases/spec-kit-template-windsurf-sh-"$VERSION".zip \
  .genreleases/spec-kit-template-windsurf-ps-"$VERSION".zip \
  # Add new agent packages here
```

#### 5. Update Agent Context Scripts
> 5. エージェントコンテキストスクリプトを更新する

##### Bash script (`scripts/bash/update-agent-context.sh`):
> Bashスクリプト（`scripts/bash/update-agent-context.sh`）:

Add file variable:
> ファイル変数を追加します。

```bash
WINDSURF_FILE="$REPO_ROOT/.windsurf/rules/specify-rules.md"
```

Add to case statement:
> case文に追加します。

```bash
case "$AGENT_TYPE" in
  # ... existing cases ...
  windsurf) update_agent_file "$WINDSURF_FILE" "Windsurf" ;;
  "") 
    # ... existing checks ...
    [ -f "$WINDSURF_FILE" ] && update_agent_file "$WINDSURF_FILE" "Windsurf";
    # Update default creation condition
    ;;
esac
```

##### PowerShell script (`scripts/powershell/update-agent-context.ps1`):
> PowerShellスクリプト（`scripts/powershell/update-agent-context.ps1`）:

Add file variable:
> ファイル変数を追加します。

```powershell
$windsurfFile = Join-Path $repoRoot '.windsurf/rules/specify-rules.md'
```

Add to switch statement:
> switch文に追加します。

```powershell
switch ($AgentType) {
    # ... existing cases ...
    'windsurf' { Update-AgentFile $windsurfFile 'Windsurf' }
    '' {
        foreach ($pair in @(
            # ... existing pairs ...
            @{file=$windsurfFile; name='Windsurf'}
        )) {
            if (Test-Path $pair.file) { Update-AgentFile $pair.file $pair.name }
        }
        # Update default creation condition
    }
}
```

#### 6. Update CLI Tool Checks (Optional)
> 6. CLIツールのチェックを更新する（任意）

For agents that require CLI tools, add checks in the `check()` command and agent validation:
> CLIツールを必要とするエージェントについては、`check()`コマンドやエージェント検証にチェックを追加します。

```python
# In check() command
tracker.add("windsurf", "Windsurf IDE (optional)")
windsurf_ok = check_tool_for_tracker("windsurf", "https://windsurf.com/", tracker)

# In init validation (only if CLI tool required)
elif selected_ai == "windsurf":
    if not check_tool("windsurf", "Install from: https://windsurf.com/"):
        console.print("[red]Error:[/red] Windsurf CLI is required for Windsurf projects")
        agent_tool_missing = True
```

**Note**: CLI tool checks are now handled automatically based on the `requires_cli` field in AGENT_CONFIG. No additional code changes needed in the `check()` or `init()` commands - they automatically loop through AGENT_CONFIG and check tools as needed.
> **注意**: CLIツールのチェックは、`AGENT_CONFIG`内の`requires_cli`フィールドに基づいて自動的に処理されます。`check()`や`init()`コマンドには追加のコード変更は不要で、AGENT_CONFIGをループして必要なツールを自動的に確認します。

## Important Design Decisions
> 重要な設計上の判断

### Using Actual CLI Tool Names as Keys
> 実際のCLIツール名をキーとして使用する

**CRITICAL**: When adding a new agent to AGENT_CONFIG, always use the **actual executable name** as the dictionary key, not a shortened or convenient version.
> **最重要**: AGENT_CONFIGに新しいエージェントを追加する際は、略称ではなく必ず**実際の実行ファイル名**を辞書のキーとして使用してください。

**Why this matters:**
> **これが重要な理由:**

- The `check_tool()` function uses `shutil.which(tool)` to find executables in the system PATH
> `check_tool()`関数は`shutil.which(tool)`を使用してシステムPATHから実行ファイルを探します。
- If the key doesn't match the actual CLI tool name, you'll need special-case mappings throughout the codebase
> キーが実際のCLIツール名と一致しない場合、コードベース全体で特別なマッピングが必要になります。
- This creates unnecessary complexity and maintenance burden
> これは不要な複雑さと保守負荷を生みます。

**Example - The Cursor Lesson:**
> **例 - Cursorから学んだこと:**

❌ **Wrong approach** (requires special-case mapping):
> ❌ **誤ったアプローチ**（特別なマッピングが必要になる）:

```python
AGENT_CONFIG = {
    "cursor": {  # Shorthand that doesn't match the actual tool
        "name": "Cursor",
        # ...
    }
}

# Then you need special cases everywhere:
cli_tool = agent_key
if agent_key == "cursor":
    cli_tool = "cursor-agent"  # Map to the real tool name
```

✅ **Correct approach** (no mapping needed):
> ✅ **正しいアプローチ**（マッピング不要）:

```python
AGENT_CONFIG = {
    "cursor-agent": {  # Matches the actual executable name
        "name": "Cursor",
        # ...
    }
}

# No special cases needed - just use agent_key directly!
```

**Benefits of this approach:**
> **このアプローチの利点:**

- Eliminates special-case logic scattered throughout the codebase
> コードベース全体に散在する特別なロジックを排除できます。
- Makes the code more maintainable and easier to understand
> コードの保守性と理解しやすさが向上します。
- Reduces the chance of bugs when adding new agents
> 新しいエージェントを追加する際のバグ発生率を低減します。
- Tool checking "just works" without additional mappings
> 追加のマッピングなしでツールのチェックがそのまま機能します。

## Agent Categories
> エージェントのカテゴリ

### CLI-Based Agents
> CLIベースのエージェント

Require a command-line tool to be installed:
> コマンドラインツールのインストールが必要です。

- **Claude Code**: `claude` CLI
> **Claude Code**は`claude` CLIを使用します。
- **Gemini CLI**: `gemini` CLI  
> **Gemini CLI**は`gemini` CLIを使用します。
- **Cursor**: `cursor-agent` CLI
> **Cursor**は`cursor-agent` CLIを使用します。
- **Qwen Code**: `qwen` CLI
> **Qwen Code**は`qwen` CLIを使用します。
- **opencode**: `opencode` CLI
> **opencode**は`opencode` CLIを使用します。
- **CodeBuddy CLI**: `codebuddy` CLI
> **CodeBuddy CLI**は`codebuddy` CLIを使用します。

### IDE-Based Agents
> IDEベースのエージェント

Work within integrated development environments:
> 統合開発環境内で動作します。

- **GitHub Copilot**: Built into VS Code/compatible editors
> **GitHub Copilot**はVS Codeおよび互換エディタに組み込まれています。
- **Windsurf**: Built into Windsurf IDE
> **Windsurf**はWindsurf IDEに組み込まれています。

## Command File Formats
> コマンドファイル形式

### Markdown Format
> Markdown形式

Used by: Claude, Cursor, opencode, Windsurf, Amazon Q Developer
> 使用エージェント: Claude、Cursor、opencode、Windsurf、Amazon Q Developer

```markdown
---
description: "Command description"
---

Command content with {SCRIPT} and $ARGUMENTS placeholders.
```
> `{SCRIPT}`や`$ARGUMENTS`のプレースホルダーを含むコマンド内容をここに記述します。

### TOML Format
> TOML形式

Used by: Gemini, Qwen
> 使用エージェント: Gemini、Qwen

```toml
description = "Command description"

prompt = """
Command content with {SCRIPT} and {{args}} placeholders.
"""
```
> `{SCRIPT}`や`{{args}}`のプレースホルダーを利用してコマンド内容を記述します。

## Directory Conventions
> ディレクトリ運用規約

- **CLI agents**: Usually `.<agent-name>/commands/`
> **CLIエージェント**の多くは`.<agent-name>/commands/`を使用します。
- **IDE agents**: Follow IDE-specific patterns:
> **IDEエージェント**はIDE固有のパターンに従います。
  - Copilot: `.github/prompts/`
  > Copilotの場合は`.github/prompts/`を使用します。
  - Cursor: `.cursor/commands/`
  > Cursorの場合は`.cursor/commands/`を使用します。
  - Windsurf: `.windsurf/workflows/`
  > Windsurfの場合は`.windsurf/workflows/`を使用します。

## Argument Patterns
> 引数パターン

Different agents use different argument placeholders:
> エージェントごとに使用する引数プレースホルダーが異なります。

- **Markdown/prompt-based**: `$ARGUMENTS`
> **Markdown／プロンプトベース**のエージェントは`$ARGUMENTS`を使用します。
- **TOML-based**: `{{args}}`
> **TOMLベース**のエージェントは`{{args}}`を使用します。
- **Script placeholders**: `{SCRIPT}` (replaced with actual script path)
> **スクリプトプレースホルダー**として`{SCRIPT}`を使用し、実際のスクリプトパスに置き換えます。
- **Agent placeholders**: `__AGENT__` (replaced with agent name)
> **エージェントプレースホルダー**として`__AGENT__`を使用し、エージェント名に置き換えます。

## Testing New Agent Integration
> 新しいエージェント統合のテスト

1. **Build test**: Run package creation script locally
> 1. **ビルドテスト**: ローカルでパッケージ生成スクリプトを実行します。
2. **CLI test**: Test `specify init --ai <agent>` command
> 2. **CLIテスト**: `specify init --ai <agent>`コマンドをテストします。
3. **File generation**: Verify correct directory structure and files
> 3. **ファイル生成**: 適切なディレクトリ構造とファイルが作成されることを確認します。
4. **Command validation**: Ensure generated commands work with the agent
> 4. **コマンド検証**: 生成されたコマンドがエージェントで動作することを確認します。
5. **Context update**: Test agent context update scripts
> 5. **コンテキスト更新**: エージェントコンテキスト更新スクリプトをテストします。

## Common Pitfalls
> よくある落とし穴

1. **Using shorthand keys instead of actual CLI tool names**: Always use the actual executable name as the AGENT_CONFIG key (e.g., `"cursor-agent"` not `"cursor"`). This prevents the need for special-case mappings throughout the codebase.
> 1. **実際のCLIツール名ではなく短縮キーを使用すること**: 常に実行ファイル名をAGENT_CONFIGのキーとして使用してください（例: `"cursor-agent"`、`"cursor"`ではない）。これにより、コードベース全体で特別なマッピングが不要になります。
2. **Forgetting update scripts**: Both bash and PowerShell scripts must be updated when adding new agents.
> 2. **更新スクリプトの更新漏れ**: 新しいエージェントを追加する際は、BashとPowerShell両方のスクリプトを更新する必要があります。
3. **Incorrect `requires_cli` value**: Set to `True` only for agents that actually have CLI tools to check; set to `False` for IDE-based agents.
> 3. **`requires_cli`の値の誤り**: CLIツールのチェックが必要なエージェントにのみ`True`を設定し、IDEベースのエージェントには`False`を設定します。
4. **Wrong argument format**: Use correct placeholder format for each agent type (`$ARGUMENTS` for Markdown, `{{args}}` for TOML).
> 4. **引数形式の間違い**: エージェントの種類に応じた適切なプレースホルダー形式を使用してください（Markdownには`$ARGUMENTS`、TOMLには`{{args}}`）。
5. **Directory naming**: Follow agent-specific conventions exactly (check existing agents for patterns).
> 5. **ディレクトリ名**: エージェント固有の規約に正確に従ってください（既存のエージェントを参照）。
6. **Help text inconsistency**: Update all user-facing text consistently (help strings, docstrings, README, error messages).
> 6. **ヘルプテキストの不整合**: ユーザー向けの文言（ヘルプ、ドキュメント文字列、README、エラーメッセージ）を一貫して更新してください。

## Future Considerations
> 今後の検討事項

When adding new agents:
> 新しいエージェントを追加する際は次の点を考慮してください。

- Consider the agent's native command/workflow patterns
> エージェント固有のコマンドやワークフローパターンを検討してください。
- Ensure compatibility with the Spec-Driven Development process
> Spec-Driven Developmentプロセスとの互換性を確認してください。
- Document any special requirements or limitations
> 特殊な要件や制約を文書化してください。
- Update this guide with lessons learned
> 得られた知見を本ガイドに反映してください。
- Verify the actual CLI tool name before adding to AGENT_CONFIG
> AGENT_CONFIGに追加する前に実際のCLIツール名を確認してください。

---
> ---

*This documentation should be updated whenever new agents are added to maintain accuracy and completeness.*
> *正確性と完全性を維持するため、新しいエージェントを追加するたびにこのドキュメントを更新してください。*
