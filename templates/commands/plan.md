---
description: Execute the implementation planning workflow using the plan template to generate design artifacts. / 計画テンプレートを使用して設計成果物を生成する実装計画ワークフローを実行
scripts:
  sh: scripts/bash/setup-plan.sh --json
  ps: scripts/powershell/setup-plan.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for FEATURE_SPEC, IMPL_PLAN, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

   **セットアップ**：リポジトリルートから`{SCRIPT}`を実行し、FEATURE_SPEC、IMPL_PLAN、SPECS_DIR、BRANCHのJSONを解析します。"I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用します：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）。

2. **Load context**: Read FEATURE_SPEC and `/memory/constitution.md`. Load IMPL_PLAN template (already copied).

   **コンテキスト読み込み**：FEATURE_SPECと`/memory/constitution.md`を読み取ります。IMPL_PLANテンプレートを読み込みます（既にコピー済み）。

3. **Execute plan workflow**: Follow the structure in IMPL_PLAN template to:
   - Fill Technical Context (mark unknowns as "NEEDS CLARIFICATION")
   - Fill Constitution Check section from constitution
   - Evaluate gates (ERROR if violations unjustified)
   - Phase 0: Generate research.md (resolve all NEEDS CLARIFICATION)
   - Phase 1: Generate data-model.md, contracts/, quickstart.md
   - Phase 1: Update agent context by running the agent script
   - Re-evaluate Constitution Check post-design

   **計画ワークフロー実行**：IMPL_PLANテンプレートの構造に従って：
   - 技術的コンテキストを記入（不明な点は「NEEDS CLARIFICATION」とマーク）
   - 憲法から憲法チェックセクションを記入
   - ゲートを評価（違反が正当化されない場合はERROR）
   - フェーズ0：research.mdを生成（すべてのNEEDS CLARIFICATIONを解決）
   - フェーズ1：data-model.md、contracts/、quickstart.mdを生成
   - フェーズ1：エージェントスクリプトを実行してエージェントコンテキストを更新
   - 設計後に憲法チェックを再評価

4. **Stop and report**: Command ends after Phase 2 planning. Report branch, IMPL_PLAN path, and generated artifacts.

   **停止と報告**：コマンドはフェーズ2計画後に終了します。ブランチ、IMPL_PLANパス、生成された成果物を報告します。

## Phases / フェーズ

### Phase 0: Outline & Research / フェーズ0：概要と調査

1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

   **上記の技術的コンテキストから不明点を抽出**：
   - 各NEEDS CLARIFICATION → 調査タスク
   - 各依存関係 → ベストプラクティスタスク
   - 各統合 → パターンタスク

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

   **調査エージェントを生成して配信**：
   ```
   技術的コンテキストの各不明点について：
     タスク："{機能コンテキスト}の{不明点}を調査"
   各技術選択について：
     タスク："{ドメイン}における{技術}のベストプラクティスを見つける"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

   **調査結果を`research.md`に統合**（以下の形式を使用）：
   - 決定：[選択されたもの]
   - 根拠：[選択した理由]
   - 検討した代替案：[他に評価したもの]

**Output**: research.md with all NEEDS CLARIFICATION resolved

**出力**：すべてのNEEDS CLARIFICATIONが解決されたresearch.md

### Phase 1: Design & Contracts / フェーズ1：設計と契約

**Prerequisites:** `research.md` complete

**前提条件：** `research.md`が完了していること

1. **Extract entities from feature spec** → `data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable

   **機能仕様からエンティティを抽出** → `data-model.md`：
   - エンティティ名、フィールド、関係性
   - 要件からの検証ルール
   - 該当する場合は状態遷移

2. **Generate API contracts** from functional requirements:
   - For each user action → endpoint
   - Use standard REST/GraphQL patterns
   - Output OpenAPI/GraphQL schema to `/contracts/`

   **機能要件からAPI契約を生成**：
   - 各ユーザーアクション → エンドポイント
   - 標準的なREST/GraphQLパターンを使用
   - OpenAPI/GraphQLスキーマを`/contracts/`に出力

3. **Agent context update**:
   - Run `{AGENT_SCRIPT}`
   - These scripts detect which AI agent is in use
   - Update the appropriate agent-specific context file
   - Add only new technology from current plan
   - Preserve manual additions between markers

   **エージェントコンテキストの更新**：
   - `{AGENT_SCRIPT}`を実行
   - これらのスクリプトは使用中のAIエージェントを検出
   - 適切なエージェント固有のコンテキストファイルを更新
   - 現在のプランからの新しい技術のみを追加
   - マーカー間の手動追加を保持

**Output**: data-model.md, /contracts/*, quickstart.md, agent-specific file

**出力**：data-model.md、/contracts/*、quickstart.md、エージェント固有ファイル

## Key rules / 主要ルール

- Use absolute paths
- ERROR on gate failures or unresolved clarifications

- 絶対パスを使用
- ゲート失敗または未解決の明確化でERROR

