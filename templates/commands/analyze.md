---
description: Perform a non-destructive cross-artifact consistency and quality analysis across spec.md, plan.md, and tasks.md after task generation. / タスク生成後のspec.md、plan.md、tasks.md間の非破壊的なクロス成果物一貫性・品質分析を実行
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

## Goal / 目標

Identify inconsistencies, duplications, ambiguities, and underspecified items across the three core artifacts (`spec.md`, `plan.md`, `tasks.md`) before implementation. This command MUST run only after `/tasks` has successfully produced a complete `tasks.md`.

実装前に3つの中核成果物（`spec.md`、`plan.md`、`tasks.md`）間の不整合、重複、曖昧さ、未定義項目を特定します。このコマンドは`/tasks`が完全な`tasks.md`を正常に生成した後でのみ実行する必要があります。

## Operating Constraints / 動作制約

**STRICTLY READ-ONLY**: Do **not** modify any files. Output a structured analysis report. Offer an optional remediation plan (user must explicitly approve before any follow-up editing commands would be invoked manually).

**厳密に読み取り専用**：ファイルを**変更しない**でください。構造化された分析レポートを出力します。オプションの修復計画を提供します（フォローアップ編集コマンドが手動で実行される前に、ユーザーが明示的に承認する必要があります）。

**Constitution Authority**: The project constitution (`/memory/constitution.md`) is **non-negotiable** within this analysis scope. Constitution conflicts are automatically CRITICAL and require adjustment of the spec, plan, or tasks—not dilution, reinterpretation, or silent ignoring of the principle. If a principle itself needs to change, that must occur in a separate, explicit constitution update outside `/analyze`.

**憲法権威**：プロジェクト憲法（`/memory/constitution.md`）は、この分析範囲内で**交渉不可**です。憲法との競合は自動的にCRITICALとなり、仕様、計画、またはタスクの調整が必要です。原則の希釈、再解釈、無視は認められません。原則自体を変更する必要がある場合は、`/analyze`の外で別の明示的な憲法更新で行う必要があります。

## Execution Steps / 実行ステップ

### 1. Initialize Analysis Context / 分析コンテキストの初期化

Run `{SCRIPT}` once from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS. Derive absolute paths:

リポジトリルートから`{SCRIPT}`を一度実行し、FEATURE_DIRとAVAILABLE_DOCSのJSONを解析します。絶対パスを導出します：

- SPEC = FEATURE_DIR/spec.md
- PLAN = FEATURE_DIR/plan.md
- TASKS = FEATURE_DIR/tasks.md

Abort with an error message if any required file is missing (instruct the user to run missing prerequisite command).
For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

必要なファイルが不足している場合はエラーメッセージで中止します（不足している前提コマンドを実行するようユーザーに指示）。
"I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用します：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）。

### 2. Load Artifacts (Progressive Disclosure) / 成果物の読み込み（段階的開示）

Load only the minimal necessary context from each artifact:

各成果物から最小限必要なコンテキストのみを読み込みます：

**From spec.md / spec.mdから:**

- Overview/Context / 概要・コンテキスト
- Functional Requirements / 機能要件
- Non-Functional Requirements / 非機能要件
- User Stories / ユーザーストーリー
- Edge Cases (if present) / エッジケース（存在する場合）

**From plan.md / plan.mdから:**

- Architecture/stack choices / アーキテクチャ・スタック選択
- Data Model references / データモデル参照
- Phases / フェーズ
- Technical constraints / 技術的制約

**From tasks.md / tasks.mdから:**

- Task IDs / タスクID
- Descriptions / 説明
- Phase grouping / フェーズグループ化
- Parallel markers [P] / 並列マーカー[P]
- Referenced file paths / 参照ファイルパス

**From constitution / 憲法から:**

- Load `/memory/constitution.md` for principle validation / 原則検証のために`/memory/constitution.md`を読み込み

### 3. Build Semantic Models / セマンティックモデルの構築

Create internal representations (do not include raw artifacts in output):

内部表現を作成します（出力に生の成果物を含めない）：

- **Requirements inventory**: Each functional + non-functional requirement with a stable key (derive slug based on imperative phrase; e.g., "User can upload file" → `user-can-upload-file`)
  **要件インベントリ**：安定したキーを持つ各機能・非機能要件（命令句に基づくスラッグを導出；例："User can upload file" → `user-can-upload-file`）
- **User story/action inventory**: Discrete user actions with acceptance criteria
  **ユーザーストーリー/アクションインベントリ**：受け入れ基準を持つ個別のユーザーアクション
- **Task coverage mapping**: Map each task to one or more requirements or stories (inference by keyword / explicit reference patterns like IDs or key phrases)
  **タスクカバレッジマッピング**：各タスクを1つ以上の要件またはストーリーにマップ（キーワード/IDやキーフレーズなどの明示的参照パターンによる推論）
- **Constitution rule set**: Extract principle names and MUST/SHOULD normative statements
  **憲法ルールセット**：原則名とMUST/SHOULD規範文を抽出

### 4. Detection Passes (Token-Efficient Analysis) / 検出パス（トークン効率的分析）

Focus on high-signal findings. Limit to 50 findings total; aggregate remainder in overflow summary.

高シグナルの発見に焦点を当てます。発見総数を50に制限し、残りはオーバーフロー要約で集約します。

#### A. Duplication Detection / 重複検出

- Identify near-duplicate requirements / ほぼ重複した要件を特定
- Mark lower-quality phrasing for consolidation / 品質の低い表現を統合用にマーク

#### B. Ambiguity Detection / 曖昧さ検出

- Flag vague adjectives (fast, scalable, secure, intuitive, robust) lacking measurable criteria
  測定可能な基準が不足している曖昧な形容詞（fast、scalable、secure、intuitive、robust）をフラグ
- Flag unresolved placeholders (TODO, TKTK, ???, `<placeholder>`, etc.)
  未解決のプレースホルダー（TODO、TKTK、???、`<placeholder>`など）をフラグ

#### C. Underspecification / 仕様不足

- Requirements with verbs but missing object or measurable outcome
  動詞があるが対象や測定可能な結果が不足している要件
- User stories missing acceptance criteria alignment
  受け入れ基準の整合性が不足しているユーザーストーリー
- Tasks referencing files or components not defined in spec/plan
  仕様/計画で定義されていないファイルやコンポーネントを参照するタスク

#### D. Constitution Alignment / 憲法整合性

- Any requirement or plan element conflicting with a MUST principle
  MUST原則と競合する要件や計画要素
- Missing mandated sections or quality gates from constitution
  憲法から義務付けられたセクションや品質ゲートの不足

#### E. Coverage Gaps / カバレッジギャップ

- Requirements with zero associated tasks
- Tasks with no mapped requirement/story
- Non-functional requirements not reflected in tasks (e.g., performance, security)

#### F. Inconsistency / 不整合

- Terminology drift (same concept named differently across files)
  用語の漂流（同じ概念がファイル間で異なって命名されている）
- Data entities referenced in plan but absent in spec (or vice versa)
  計画で参照されているが仕様にないデータエンティティ（またはその逆）
- Task ordering contradictions (e.g., integration tasks before foundational setup tasks without dependency note)
  タスク順序の矛盾（例：依存関係の注記なしに基盤セットアップタスクより前の統合タスク）
- Conflicting requirements (e.g., one requires Next.js while other specifies Vue)
  競合する要件（例：一方はNext.jsを要求し、他方はVueを指定）

### 5. Severity Assignment / 重要度の割り当て

Use this heuristic to prioritize findings:

発見事項の優先順位付けにこのヒューリスティックを使用します：

- **CRITICAL**: Violates constitution MUST, missing core spec artifact, or requirement with zero coverage that blocks baseline functionality
  **CRITICAL**：憲法のMUSTに違反、中核仕様成果物の不足、またはベースライン機能をブロックするカバレッジゼロの要件
- **HIGH**: Duplicate or conflicting requirement, ambiguous security/performance attribute, untestable acceptance criterion
  **HIGH**：重複または競合する要件、曖昧なセキュリティ/パフォーマンス属性、テスト不可能な受け入れ基準
- **MEDIUM**: Terminology drift, missing non-functional task coverage, underspecified edge case
  **MEDIUM**：用語の漂流、非機能タスクカバレッジの不足、仕様不足のエッジケース
- **LOW**: Style/wording improvements, minor redundancy not affecting execution order
  **LOW**：スタイル/文言改善、実行順序に影響しない軽微な冗長性

### 6. Produce Compact Analysis Report / コンパクト分析レポートの作成

Output a Markdown report (no file writes) with the following structure:

以下の構造でMarkdownレポートを出力します（ファイル書き込みなし）：

## Specification Analysis Report / 仕様分析レポート

| ID | Category | Severity | Location(s) | Summary | Recommendation |
|----|----------|----------|-------------|---------|----------------|
| A1 | Duplication | HIGH | spec.md:L120-134 | Two similar requirements ... | Merge phrasing; keep clearer version |

(Add one row per finding; generate stable IDs prefixed by category initial.)

（発見事項ごとに1行追加；カテゴリーイニシャルをプレフィックスとした安定したIDを生成）

**Coverage Summary Table / カバレッジ要約テーブル:**

| Requirement Key | Has Task? | Task IDs | Notes |
|-----------------|-----------|----------|-------|

**Constitution Alignment Issues / 憲法整合性問題:** (if any / ある場合)

**Unmapped Tasks / マップされていないタスク:** (if any / ある場合)

**Metrics / メトリクス:**

- Total Requirements / 総要件数
- Total Tasks / 総タスク数
- Coverage % (requirements with >=1 task) / カバレッジ%（1つ以上のタスクを持つ要件）
- Ambiguity Count / 曖昧さ数
- Duplication Count / 重複数
- Critical Issues Count / 重要問題数

### 7. Provide Next Actions / 次のアクションの提供

At end of report, output a concise Next Actions block:

レポート最後に、簡潔な次のアクションブロックを出力：

- If CRITICAL issues exist: Recommend resolving before `/implement`
  CRITICALな問題が存在する場合：`/implement`前の解決を推奨
- If only LOW/MEDIUM: User may proceed, but provide improvement suggestions
  LOW/MEDIUMのみの場合：ユーザーは進行可能だが、改善提案を提供
- Provide explicit command suggestions: e.g., "Run /specify with refinement", "Run /plan to adjust architecture", "Manually edit tasks.md to add coverage for 'performance-metrics'"
  明示的なコマンド提案を提供：例「改良で/specifyを実行」、「アーキテクチャ調整で/planを実行」、「'performance-metrics'のカバレッジを追加するためにtasks.mdを手動編集」

### 8. Offer Remediation / 修復の提供

Ask the user: "Would you like me to suggest concrete remediation edits for the top N issues?" (Do NOT apply them automatically.)

ユーザーに質問：「上位N個の問題に対する具体的な修復編集を提案しますか？」（自動適用はしない）

## Operating Principles / 動作原則

### Context Efficiency / コンテキスト効率

- **Minimal high-signal tokens**: Focus on actionable findings, not exhaustive documentation
  **最小限の高シグナルトークン**：網羅的な文書化ではなく、実行可能な発見に焦点
- **Progressive disclosure**: Load artifacts incrementally; don't dump all content into analysis
  **段階的開示**：成果物を段階的に読み込み；すべてのコンテンツを分析にダンプしない
- **Token-efficient output**: Limit findings table to 50 rows; summarize overflow
  **トークン効率的出力**：発見テーブルを50行に制限；オーバーフローを要約
- **Deterministic results**: Rerunning without changes should produce consistent IDs and counts
  **決定論的結果**：変更なしの再実行で一貫したIDとカウントを生成

### Analysis Guidelines / 分析ガイドライン

- **NEVER modify files** (this is read-only analysis)
  **ファイルを決して変更しない**（これは読み取り専用分析）
- **NEVER hallucinate missing sections** (if absent, report them accurately)
  **不足セクションを決して幻覚しない**（不在の場合、正確に報告）
- **Prioritize constitution violations** (these are always CRITICAL)
  **憲法違反を優先**（これらは常にCRITICAL）
- **Use examples over exhaustive rules** (cite specific instances, not generic patterns)
  **網羅的ルールより例を使用**（汎用パターンではなく具体的インスタンスを引用）
- **Report zero issues gracefully** (emit success report with coverage statistics)
  **ゼロ問題を優雅に報告**（カバレッジ統計付きの成功レポートを出力）

## Context / コンテキスト

{ARGS}

