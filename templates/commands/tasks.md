---
description: Generate an actionable, dependency-ordered tasks.md for the feature based on available design artifacts. / 利用可能な設計成果物に基づいて、機能用の実行可能で依存関係順序付きのtasks.mdを生成
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

1. **Setup**: Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

   **セットアップ**：リポジトリルートから`{SCRIPT}`を実行し、FEATURE_DIRとAVAILABLE_DOCSリストを解析します。すべてのパスは絶対パスである必要があります。"I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用します：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）。

2. **Load design documents**: Read from FEATURE_DIR:
   - **Required**: plan.md (tech stack, libraries, structure), spec.md (user stories with priorities)
   - **Optional**: data-model.md (entities), contracts/ (API endpoints), research.md (decisions), quickstart.md (test scenarios)
   - Note: Not all projects have all documents. Generate tasks based on what's available.

   **設計文書の読み込み**：FEATURE_DIRから読み取り：
   - **必須**：plan.md（技術スタック、ライブラリ、構造）、spec.md（優先度付きユーザーストーリー）
   - **オプション**：data-model.md（エンティティ）、contracts/（APIエンドポイント）、research.md（決定事項）、quickstart.md（テストシナリオ）
   - 注：すべてのプロジェクトがすべての文書を持つわけではありません。利用可能なものに基づいてタスクを生成します。

3. **Execute task generation workflow**:
   - Load plan.md and extract tech stack, libraries, project structure
   - Load spec.md and extract user stories with their priorities (P1, P2, P3, etc.)
   - If data-model.md exists: Extract entities and map to user stories
   - If contracts/ exists: Map endpoints to user stories
   - If research.md exists: Extract decisions for setup tasks
   - Generate tasks organized by user story (see Task Generation Rules below)
   - Generate dependency graph showing user story completion order
   - Create parallel execution examples per user story
   - Validate task completeness (each user story has all needed tasks, independently testable)

   **タスク生成ワークフローの実行**：
   - plan.mdを読み込み、技術スタック、ライブラリ、プロジェクト構造を抽出
   - spec.mdを読み込み、優先度付きユーザーストーリー（P1、P2、P3など）を抽出
   - data-model.mdが存在する場合：エンティティを抽出し、ユーザーストーリーにマップ
   - contracts/が存在する場合：エンドポイントをユーザーストーリーにマップ
   - research.mdが存在する場合：セットアップタスクの決定事項を抽出
   - ユーザーストーリー別に整理されたタスクを生成（下記のタスク生成ルールを参照）
   - ユーザーストーリー完了順序を示す依存関係グラフを生成
   - ユーザーストーリーごとの並列実行例を作成
   - タスクの完全性を検証（各ユーザーストーリーが必要なタスクをすべて持ち、独立してテスト可能）

4. **Generate tasks.md**: Use `.specify/templates/tasks-template.md` as structure, fill with:
   - Correct feature name from plan.md
   - Phase 1: Setup tasks (project initialization)
   - Phase 2: Foundational tasks (blocking prerequisites for all user stories)
   - Phase 3+: One phase per user story (in priority order from spec.md)
   - Each phase includes: story goal, independent test criteria, tests (if requested), implementation tasks
   - Final Phase: Polish & cross-cutting concerns
   - All tasks must follow the strict checklist format (see Task Generation Rules below)
   - Clear file paths for each task
   - Dependencies section showing story completion order
   - Parallel execution examples per story
   - Implementation strategy section (MVP first, incremental delivery)

   **tasks.mdの生成**：`.specify/templates/tasks-template.md`を構造として使用し、以下で記入：
   - plan.mdからの正しい機能名
   - フェーズ1：セットアップタスク（プロジェクト初期化）
   - フェーズ2：基盤タスク（すべてのユーザーストーリーのブロッキング前提条件）
   - フェーズ3+：ユーザーストーリーごとに1フェーズ（spec.mdの優先順序）
   - 各フェーズには：ストーリー目標、独立テスト基準、テスト（要求された場合）、実装タスク
   - 最終フェーズ：仕上げと横断的関心事
   - すべてのタスクは厳密なチェックリスト形式に従う必要がある（下記のタスク生成ルールを参照）
   - 各タスクの明確なファイルパス
   - ストーリー完了順序を示す依存関係セクション
   - ストーリーごとの並列実行例
   - 実装戦略セクション（MVPファースト、段階的配信）

5. **Report**: Output path to generated tasks.md and summary:
   - Total task count
   - Task count per user story
   - Parallel opportunities identified
   - Independent test criteria for each story
   - Suggested MVP scope (typically just User Story 1)
   - Format validation: Confirm ALL tasks follow the checklist format (checkbox, ID, labels, file paths)

   **レポート**：生成されたtasks.mdへのパスと概要を出力：
   - 総タスク数
   - ユーザーストーリーごとのタスク数
   - 特定された並列実行機会
   - 各ストーリーの独立テスト基準
   - 推奨MVPスコープ（通常はユーザーストーリー1のみ）
   - 形式検証：すべてのタスクがチェックリスト形式に従っていることを確認（チェックボックス、ID、ラベル、ファイルパス）

Context for task generation: {ARGS}

タスク生成のためのコンテキスト：{ARGS}

The tasks.md should be immediately executable - each task must be specific enough that an LLM can complete it without additional context.

tasks.mdは即座に実行可能である必要があります。各タスクは追加のコンテキストなしにLLMが完了できるほど具体的でなければなりません。

## Task Generation Rules / タスク生成ルール

**CRITICAL**: Tasks MUST be organized by user story to enable independent implementation and testing.

**重要**：タスクは独立した実装とテストを可能にするため、ユーザーストーリー別に整理する必要があります。

**Tests are OPTIONAL**: Only generate test tasks if explicitly requested in the feature specification or if user requests TDD approach.

**テストはオプション**：機能仕様で明示的に要求された場合、またはユーザーがTDDアプローチを要求した場合のみテストタスクを生成します。

### Checklist Format (REQUIRED) / チェックリスト形式（必須）

Every task MUST strictly follow this format:

すべてのタスクは以下の形式に厳密に従う必要があります：

```text
- [ ] [TaskID] [P?] [Story?] Description with file path
```

**Format Components**:

**形式コンポーネント**：

1. **Checkbox**: ALWAYS start with `- [ ]` (markdown checkbox)
   **チェックボックス**：常に`- [ ]`（マークダウンチェックボックス）で開始

2. **Task ID**: Sequential number (T001, T002, T003...) in execution order
   **タスクID**：実行順序での連番（T001、T002、T003...）

3. **[P] marker**: Include ONLY if task is parallelizable (different files, no dependencies on incomplete tasks)
   **[P]マーカー**：タスクが並列化可能な場合のみ含める（異なるファイル、未完了タスクへの依存なし）

4. **[Story] label**: REQUIRED for user story phase tasks only
   **[Story]ラベル**：ユーザーストーリーフェーズタスクでのみ必須
   - Format: [US1], [US2], [US3], etc. (maps to user stories from spec.md)
     形式：[US1]、[US2]、[US3]など（spec.mdのユーザーストーリーにマップ）
   - Setup phase: NO story label / セットアップフェーズ：ストーリーラベルなし
   - Foundational phase: NO story label / 基盤フェーズ：ストーリーラベルなし  
   - User Story phases: MUST have story label / ユーザーストーリーフェーズ：ストーリーラベル必須
   - Polish phase: NO story label / 仕上げフェーズ：ストーリーラベルなし

5. **Description**: Clear action with exact file path
   **説明**：正確なファイルパスを含む明確なアクション

**Examples / 例**:

- ✅ CORRECT: `- [ ] T001 Create project structure per implementation plan`
  ✅ 正しい：`- [ ] T001 実装計画に従ってプロジェクト構造を作成`
- ✅ CORRECT: `- [ ] T005 [P] Implement authentication middleware in src/middleware/auth.py`
  ✅ 正しい：`- [ ] T005 [P] src/middleware/auth.pyに認証ミドルウェアを実装`
- ✅ CORRECT: `- [ ] T012 [P] [US1] Create User model in src/models/user.py`
  ✅ 正しい：`- [ ] T012 [P] [US1] src/models/user.pyにUserモデルを作成`
- ✅ CORRECT: `- [ ] T014 [US1] Implement UserService in src/services/user_service.py`
  ✅ 正しい：`- [ ] T014 [US1] src/services/user_service.pyにUserServiceを実装`
- ❌ WRONG: `- [ ] Create User model` (missing ID and Story label)
  ❌ 間違い：`- [ ] Userモデルを作成`（IDとストーリーラベルが不足）
- ❌ WRONG: `T001 [US1] Create model` (missing checkbox)
  ❌ 間違い：`T001 [US1] モデルを作成`（チェックボックスが不足）
- ❌ WRONG: `- [ ] [US1] Create User model` (missing Task ID)
  ❌ 間違い：`- [ ] [US1] Userモデルを作成`（タスクIDが不足）
- ❌ WRONG: `- [ ] T001 [US1] Create model` (missing file path)
  ❌ 間違い：`- [ ] T001 [US1] モデルを作成`（ファイルパスが不足）

### Task Organization / タスク整理

1. **From User Stories (spec.md)** - PRIMARY ORGANIZATION:
   - Each user story (P1, P2, P3...) gets its own phase
   - Map all related components to their story:
     - Models needed for that story
     - Services needed for that story
     - Endpoints/UI needed for that story
     - If tests requested: Tests specific to that story
   - Mark story dependencies (most stories should be independent)

   **ユーザーストーリーから（spec.md）** - 主要な整理：
   - 各ユーザーストーリー（P1、P2、P3...）が独自のフェーズを持つ
   - 関連するすべてのコンポーネントをそのストーリーにマップ：
     - そのストーリーに必要なモデル
     - そのストーリーに必要なサービス
     - そのストーリーに必要なエンドポイント/UI
     - テストが要求された場合：そのストーリー固有のテスト
   - ストーリー依存関係をマーク（ほとんどのストーリーは独立している必要がある）
   
2. **From Contracts**:
   - Map each contract/endpoint → to the user story it serves
   - If tests requested: Each contract → contract test task [P] before implementation in that story's phase

   **契約から**：
   - 各契約/エンドポイント → それが提供するユーザーストーリーにマップ
   - テストが要求された場合：各契約 → そのストーリーのフェーズの実装前に契約テストタスク[P]
   
3. **From Data Model**:
   - Map each entity to the user story(ies) that need it
   - If entity serves multiple stories: Put in earliest story or Setup phase
   - Relationships → service layer tasks in appropriate story phase

   **データモデルから**：
   - 各エンティティをそれを必要とするユーザーストーリーにマップ
   - エンティティが複数のストーリーに提供する場合：最初のストーリーまたはセットアップフェーズに配置
   - 関係 → 適切なストーリーフェーズのサービス層タスク
   
4. **From Setup/Infrastructure**:
   - Shared infrastructure → Setup phase (Phase 1)
   - Foundational/blocking tasks → Foundational phase (Phase 2)
   - Story-specific setup → within that story's phase

   **セットアップ/インフラストラクチャから**：
   - 共有インフラストラクチャ → セットアップフェーズ（フェーズ1）
   - 基盤/ブロッキングタスク → 基盤フェーズ（フェーズ2）
   - ストーリー固有のセットアップ → そのストーリーのフェーズ内

### Phase Structure / フェーズ構造

- **Phase 1**: Setup (project initialization)
  **フェーズ1**：セットアップ（プロジェクト初期化）
- **Phase 2**: Foundational (blocking prerequisites - MUST complete before user stories)
  **フェーズ2**：基盤（ブロッキング前提条件 - ユーザーストーリー前に完了必須）
- **Phase 3+**: User Stories in priority order (P1, P2, P3...)
  **フェーズ3+**：優先順序でのユーザーストーリー（P1、P2、P3...）
  - Within each story: Tests (if requested) → Models → Services → Endpoints → Integration
    各ストーリー内：テスト（要求された場合） → モデル → サービス → エンドポイント → 統合
  - Each phase should be a complete, independently testable increment
    各フェーズは完全で独立してテスト可能な増分であるべき
- **Final Phase**: Polish & Cross-Cutting Concerns
  **最終フェーズ**：仕上げと横断的関心事


