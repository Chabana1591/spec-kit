---
description: Execute the implementation plan by processing and executing all tasks defined in tasks.md / tasks.mdで定義されたすべてのタスクを処理・実行して実装計画を実行
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

1. Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

   リポジトリルートから`{SCRIPT}`を実行し、FEATURE_DIRとAVAILABLE_DOCSリストを解析します。すべてのパスは絶対パスである必要があります。"I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用します：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）。

2. **Check checklists status** (if FEATURE_DIR/checklists/ exists):
   - Scan all checklist files in the checklists/ directory
   - For each checklist, count:
     * Total items: All lines matching `- [ ]` or `- [X]` or `- [x]`
     * Completed items: Lines matching `- [X]` or `- [x]`
     * Incomplete items: Lines matching `- [ ]`
   - Create a status table:
     ```
     | Checklist | Total | Completed | Incomplete | Status |
     |-----------|-------|-----------|------------|--------|
     | ux.md     | 12    | 12        | 0          | ✓ PASS |
     | test.md   | 8     | 5         | 3          | ✗ FAIL |
     | security.md | 6   | 6         | 0          | ✓ PASS |
     ```
   - Calculate overall status:
     * **PASS**: All checklists have 0 incomplete items
     * **FAIL**: One or more checklists have incomplete items

   **チェックリスト状態の確認**（FEATURE_DIR/checklists/が存在する場合）：
   - checklists/ディレクトリ内のすべてのチェックリストファイルをスキャン
   - 各チェックリストについて、以下をカウント：
     * 総項目数：`- [ ]`または`- [X]`または`- [x]`にマッチするすべての行
     * 完了項目数：`- [X]`または`- [x]`にマッチする行
     * 未完了項目数：`- [ ]`にマッチする行
   - 状態テーブルを作成：
     ```
     | Checklist | Total | Completed | Incomplete | Status |
     |-----------|-------|-----------|------------|--------|
     | ux.md     | 12    | 12        | 0          | ✓ PASS |
     | test.md   | 8     | 5         | 3          | ✗ FAIL |
     | security.md | 6   | 6         | 0          | ✓ PASS |
     ```
   - 全体状態を計算：
     * **PASS**：すべてのチェックリストで未完了項目が0
     * **FAIL**：1つ以上のチェックリストに未完了項目がある
   
   - **If any checklist is incomplete**:
     * Display the table with incomplete item counts
     * **STOP** and ask: "Some checklists are incomplete. Do you want to proceed with implementation anyway? (yes/no)"
     * Wait for user response before continuing
     * If user says "no" or "wait" or "stop", halt execution
     * If user says "yes" or "proceed" or "continue", proceed to step 3

   **チェックリストが未完了の場合**：
     * 未完了項目数を含むテーブルを表示
     * **停止**して質問：「一部のチェックリストが未完了です。それでも実装を続行しますか？ (yes/no)」
     * 続行前にユーザーの応答を待つ
     * ユーザーが「no」「wait」「stop」と言った場合、実行を停止
     * ユーザーが「yes」「proceed」「continue」と言った場合、ステップ3に進む
   
   - **If all checklists are complete**:
     * Display the table showing all checklists passed
     * Automatically proceed to step 3

   **すべてのチェックリストが完了している場合**：
     * すべてのチェックリストが合格したことを示すテーブルを表示
     * 自動的にステップ3に進む

3. Load and analyze the implementation context:
   - **REQUIRED**: Read tasks.md for the complete task list and execution plan
   - **REQUIRED**: Read plan.md for tech stack, architecture, and file structure
   - **IF EXISTS**: Read data-model.md for entities and relationships
   - **IF EXISTS**: Read contracts/ for API specifications and test requirements
   - **IF EXISTS**: Read research.md for technical decisions and constraints
   - **IF EXISTS**: Read quickstart.md for integration scenarios

   **実装コンテキストの読み込みと分析**：
   - **必須**：完全なタスクリストと実行計画のためにtasks.mdを読み取り
   - **必須**：技術スタック、アーキテクチャ、ファイル構造のためにplan.mdを読み取り
   - **存在する場合**：エンティティと関係のためにdata-model.mdを読み取り
   - **存在する場合**：API仕様とテスト要件のためにcontracts/を読み取り
   - **存在する場合**：技術決定と制約のためにresearch.mdを読み取り
   - **存在する場合**：統合シナリオのためにquickstart.mdを読み取り

4. **Project Setup Verification**:
   - **REQUIRED**: Create/verify ignore files based on actual project setup:

   **プロジェクトセットアップ検証**：
   - **必須**：実際のプロジェクトセットアップに基づいて無視ファイルを作成/検証：
   
   **Detection & Creation Logic**:
   - Check if the following command succeeds to determine if the repository is a git repo (create/verify .gitignore if so):

   **検出と作成ロジック**：
   - 以下のコマンドが成功するかチェックして、リポジトリがgitリポジトリかを判定（そうであれば.gitignoreを作成/検証）：

     ```sh
     git rev-parse --git-dir 2>/dev/null
     ```
   - Check if Dockerfile* exists or Docker in plan.md → create/verify .dockerignore
   - Check if .eslintrc* or eslint.config.* exists → create/verify .eslintignore
   - Check if .prettierrc* exists → create/verify .prettierignore
   - Check if .npmrc or package.json exists → create/verify .npmignore (if publishing)
   - Check if terraform files (*.tf) exist → create/verify .terraformignore
   - Check if .helmignore needed (helm charts present) → create/verify .helmignore

   - Dockerfile*が存在するかplan.mdにDockerがあるかチェック → .dockerignoreを作成/検証
   - .eslintrc*またはeslint.config.*が存在するかチェック → .eslintignoreを作成/検証
   - .prettierrc*が存在するかチェック → .prettierignoreを作成/検証
   - .npmrcまたはpackage.jsonが存在するかチェック → .npmignoreを作成/検証（公開する場合）
   - terraformファイル（*.tf）が存在するかチェック → .terraformignoreを作成/検証
   - .helmignoreが必要かチェック（helmチャートが存在） → .helmignoreを作成/検証
   
   **If ignore file already exists**: Verify it contains essential patterns, append missing critical patterns only
   **If ignore file missing**: Create with full pattern set for detected technology

   **無視ファイルが既に存在する場合**：必須パターンが含まれているか検証し、不足している重要パターンのみを追加
   **無視ファイルが不足している場合**：検出された技術用の完全パターンセットで作成
   
   **Common Patterns by Technology** (from plan.md tech stack):
   - **Node.js/JavaScript**: `node_modules/`, `dist/`, `build/`, `*.log`, `.env*`
   - **Python**: `__pycache__/`, `*.pyc`, `.venv/`, `venv/`, `dist/`, `*.egg-info/`
   - **Java**: `target/`, `*.class`, `*.jar`, `.gradle/`, `build/`
   - **C#/.NET**: `bin/`, `obj/`, `*.user`, `*.suo`, `packages/`
   - **Go**: `*.exe`, `*.test`, `vendor/`, `*.out`
   - **Ruby**: `.bundle/`, `log/`, `tmp/`, `*.gem`, `vendor/bundle/`
   - **PHP**: `vendor/`, `*.log`, `*.cache`, `*.env`
   - **Rust**: `target/`, `debug/`, `release/`, `*.rs.bk`, `*.rlib`, `*.prof*`, `.idea/`, `*.log`, `.env*`
   - **Kotlin**: `build/`, `out/`, `.gradle/`, `.idea/`, `*.class`, `*.jar`, `*.iml`, `*.log`, `.env*`
   - **C++**: `build/`, `bin/`, `obj/`, `out/`, `*.o`, `*.so`, `*.a`, `*.exe`, `*.dll`, `.idea/`, `*.log`, `.env*`
   - **C**: `build/`, `bin/`, `obj/`, `out/`, `*.o`, `*.a`, `*.so`, `*.exe`, `Makefile`, `config.log`, `.idea/`, `*.log`, `.env*`
   - **Universal**: `.DS_Store`, `Thumbs.db`, `*.tmp`, `*.swp`, `.vscode/`, `.idea/`

   **技術別共通パターン**（plan.md技術スタックから）：
   - **Node.js/JavaScript**: `node_modules/`, `dist/`, `build/`, `*.log`, `.env*`
   - **Python**: `__pycache__/`, `*.pyc`, `.venv/`, `venv/`, `dist/`, `*.egg-info/`
   - **Java**: `target/`, `*.class`, `*.jar`, `.gradle/`, `build/`
   - **C#/.NET**: `bin/`, `obj/`, `*.user`, `*.suo`, `packages/`
   - **Go**: `*.exe`, `*.test`, `vendor/`, `*.out`
   - **Ruby**: `.bundle/`, `log/`, `tmp/`, `*.gem`, `vendor/bundle/`
   - **PHP**: `vendor/`, `*.log`, `*.cache`, `*.env`
   - **Rust**: `target/`, `debug/`, `release/`, `*.rs.bk`, `*.rlib`, `*.prof*`, `.idea/`, `*.log`, `.env*`
   - **Kotlin**: `build/`, `out/`, `.gradle/`, `.idea/`, `*.class`, `*.jar`, `*.iml`, `*.log`, `.env*`
   - **C++**: `build/`, `bin/`, `obj/`, `out/`, `*.o`, `*.so`, `*.a`, `*.exe`, `*.dll`, `.idea/`, `*.log`, `.env*`
   - **C**: `build/`, `bin/`, `obj/`, `out/`, `*.o`, `*.a`, `*.so`, `*.exe`, `Makefile`, `config.log`, `.idea/`, `*.log`, `.env*`
   - **汎用**: `.DS_Store`, `Thumbs.db`, `*.tmp`, `*.swp`, `.vscode/`, `.idea/`
   
   **ツール固有パターン**：
   - **Docker**: `node_modules/`, `.git/`, `Dockerfile*`, `.dockerignore`, `*.log*`, `.env*`, `coverage/`
   - **ESLint**: `node_modules/`, `dist/`, `build/`, `coverage/`, `*.min.js`
   - **Prettier**: `node_modules/`, `dist/`, `build/`, `coverage/`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`
   - **Terraform**: `.terraform/`, `*.tfstate*`, `*.tfvars`, `.terraform.lock.hcl`

## 5. Parse tasks.md Structure and Extract Components

**Parse tasks.md structure and extract:**

**tasks.md構造を解析し以下を抽出：**

   - **Task phases**: Setup, Tests, Core, Integration, Polish
   - **Task dependencies**: Sequential vs parallel execution rules
   - **Task details**: ID, description, file paths, parallel markers [P]
   - **Execution flow**: Order and dependency requirements

   - **タスクフェーズ**：セットアップ、テスト、コア、統合、仕上げ
   - **タスク依存関係**：順次実行 vs 並列実行ルール
   - **タスク詳細**：ID、説明、ファイルパス、並列マーカー [P]
   - **実行フロー**：順序と依存関係要件

## 6. Execute Implementation Following the Task Plan

**Execute implementation following the task plan:**

**タスクプランに従って実装を実行：**

   - **Phase-by-phase execution**: Complete each phase before moving to the next
   - **Respect dependencies**: Run sequential tasks in order, parallel tasks [P] can run together  
   - **Follow TDD approach**: Execute test tasks before their corresponding implementation tasks
   - **File-based coordination**: Tasks affecting the same files must run sequentially
   - **Validation checkpoints**: Verify each phase completion before proceeding

   - **フェーズ毎の実行**：次のフェーズに進む前に各フェーズを完了
   - **依存関係の尊重**：順次タスクを順序通りに実行、並列タスク [P] は同時に実行可能
   - **TDDアプローチに従う**：対応する実装タスクの前にテストタスクを実行
   - **ファイルベースの調整**：同じファイルに影響するタスクは順次実行必須
   - **検証チェックポイント**：進行前に各フェーズ完了を検証

## 7. Implementation Execution Rules

**Implementation execution rules:**

**実装実行ルール：**

   - **Setup first**: Initialize project structure, dependencies, configuration
   - **Tests before code**: If you need to write tests for contracts, entities, and integration scenarios
   - **Core development**: Implement models, services, CLI commands, endpoints
   - **Integration work**: Database connections, middleware, logging, external services
   - **Polish and validation**: Unit tests, performance optimization, documentation

   - **最初にセットアップ**：プロジェクト構造、依存関係、設定を初期化
   - **コード前にテスト**：契約、エンティティ、統合シナリオのテストを記述する必要がある場合
   - **コア開発**：モデル、サービス、CLIコマンド、エンドポイントを実装
   - **統合作業**：データベース接続、ミドルウェア、ログ、外部サービス
   - **仕上げと検証**：単体テスト、パフォーマンス最適化、ドキュメント

## 8. Progress Tracking and Error Handling

**Progress tracking and error handling:**

**進捗追跡とエラー処理：**

   - Report progress after each completed task
   - Halt execution if any non-parallel task fails
   - For parallel tasks [P], continue with successful tasks, report failed ones
   - Provide clear error messages with context for debugging
   - Suggest next steps if implementation cannot proceed
   - **IMPORTANT** For completed tasks, make sure to mark the task off as [X] in the tasks file.

   - 各完了タスク後に進捗を報告
   - 非並列タスクが失敗した場合は実行を停止
   - 並列タスク [P] の場合、成功したタスクは続行し、失敗したものを報告
   - デバッグ用の文脈を含む明確なエラーメッセージを提供
   - 実装が進行できない場合は次のステップを提案
   - **重要** 完了したタスクについては、tasksファイルで [X] としてマークすることを確認

## 9. Completion Validation

**Completion validation:**

**完了検証：**

   - Verify all required tasks are completed
   - Check that implemented features match the original specification
   - Validate that tests pass and coverage meets requirements
   - Confirm the implementation follows the technical plan
   - Report final status with summary of completed work

   - すべての必要なタスクが完了していることを確認
   - 実装された機能が元の仕様と一致することを確認
   - テストが通り、カバレッジが要件を満たすことを検証
   - 実装が技術計画に従っていることを確認
   - 完了した作業の要約と最終ステータスを報告

Note: This command assumes a complete task breakdown exists in tasks.md. If tasks are incomplete or missing, suggest running `/tasks` first to regenerate the task list.

