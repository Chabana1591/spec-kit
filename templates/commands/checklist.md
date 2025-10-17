---
description: Generate a custom checklist for the current feature based on user requirements. / ユーザー要件に基づいて現在の機能のカスタムチェックリストを生成
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## Checklist Purpose: "Unit Tests for English" / チェックリストの目的：「英語のための単体テスト」

**CRITICAL CONCEPT**: Checklists are **UNIT TESTS FOR REQUIREMENTS WRITING** - they validate the quality, clarity, and completeness of requirements in a given domain.

**重要なコンセプト**：チェックリストは**要件記述のための単体テスト**です。特定のドメインにおける要件の品質、明確性、完全性を検証します。

**NOT for verification/testing / 検証・テスト用ではありません**:
- ❌ NOT "Verify the button clicks correctly" / ❌ 「ボタンが正しくクリックされることを確認」ではない
- ❌ NOT "Test error handling works" / ❌ 「エラーハンドリングが動作することをテスト」ではない
- ❌ NOT "Confirm the API returns 200" / ❌ 「APIが200を返すことを確認」ではない
- ❌ NOT checking if code/implementation matches the spec / ❌ コード・実装が仕様に一致するかのチェックではない

**FOR requirements quality validation / 要件品質検証のため**:
- ✅ "Are visual hierarchy requirements defined for all card types?" (completeness) / ✅ 「すべてのカードタイプに対して視覚的階層要件が定義されているか？」（完全性）
- ✅ "Is 'prominent display' quantified with specific sizing/positioning?" (clarity) / ✅ 「『目立つ表示』が具体的なサイズ・位置で定量化されているか？」（明確性）
- ✅ "Are hover state requirements consistent across all interactive elements?" (consistency) / ✅ 「ホバー状態要件がすべてのインタラクティブ要素で一貫しているか？」（一貫性）
- ✅ "Are accessibility requirements defined for keyboard navigation?" (coverage) / ✅ 「キーボードナビゲーションのアクセシビリティ要件が定義されているか？」（カバレッジ）
- ✅ "Does the spec define what happens when logo image fails to load?" (edge cases) / ✅ 「ロゴ画像の読み込みが失敗した場合の動作が仕様で定義されているか？」（エッジケース）

**Metaphor**: If your spec is code written in English, the checklist is its unit test suite. You're testing whether the requirements are well-written, complete, unambiguous, and ready for implementation - NOT whether the implementation works.

**比喩**：仕様が英語で書かれたコードだとすると、チェックリストはその単体テストスイートです。要件が適切に書かれ、完全で、明確で、実装準備ができているかをテストします。実装が動作するかではありません。

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Execution Steps / 実行ステップ

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS list.
   - All file paths must be absolute.
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

   **セットアップ**：リポジトリルートから`{SCRIPT}`を実行し、FEATURE_DIRとAVAILABLE_DOCSリストのJSONを解析します。
   - すべてのファイルパスは絶対パスである必要があります。
   - "I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用します：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）。

2. **Clarify intent (dynamic)**: Derive up to THREE initial contextual clarifying questions (no pre-baked catalog). They MUST:
   - Be generated from the user's phrasing + extracted signals from spec/plan/tasks
   - Only ask about information that materially changes checklist content
   - Be skipped individually if already unambiguous in `$ARGUMENTS`
   - Prefer precision over breadth

   **意図の明確化（動的）**：最大3つの初期コンテキスト明確化質問を導出（事前準備カタログなし）。以下が必須：
   - ユーザーの表現 + spec/plan/tasksから抽出されたシグナルから生成
   - チェックリスト内容を実質的に変更する情報についてのみ質問
   - `$ARGUMENTS`で既に明確な場合は個別にスキップ
   - 幅広さより精度を優先

   Generation algorithm:
   
   生成アルゴリズム：
   
   1. Extract signals: feature domain keywords (e.g., auth, latency, UX, API), risk indicators ("critical", "must", "compliance"), stakeholder hints ("QA", "review", "security team"), and explicit deliverables ("a11y", "rollback", "contracts").
   
      シグナルを抽出：機能ドメインキーワード（例：auth、latency、UX、API）、リスク指標（"critical"、"must"、"compliance"）、ステークホルダーヒント（"QA"、"review"、"security team"）、明示的成果物（"a11y"、"rollback"、"contracts"）
   
   2. Cluster signals into candidate focus areas (max 4) ranked by relevance.
   
      シグナルを関連性でランク付けした候補フォーカス領域（最大4つ）にクラスター化
   
   3. Identify probable audience & timing (author, reviewer, QA, release) if not explicit.
   
      明示的でない場合、可能性のある対象者とタイミング（作成者、レビュアー、QA、リリース）を特定
   
   4. Detect missing dimensions: scope breadth, depth/rigor, risk emphasis, exclusion boundaries, measurable acceptance criteria.
   
      不足している次元を検出：スコープの幅、深度/厳密性、リスク強調、除外境界、測定可能な受け入れ基準
   
   5. Formulate questions chosen from these archetypes:
   
      これらの原型から選択された質問を策定：
      
      - Scope refinement (e.g., "Should this include integration touchpoints with X and Y or stay limited to local module correctness?")
        スコープ改良（例：「これはXとYとの統合タッチポイントを含むべきか、ローカルモジュール正確性に限定すべきか？」）
      - Risk prioritization (e.g., "Which of these potential risk areas should receive mandatory gating checks?")
        リスク優先順位付け（例：「これらの潜在的リスク領域のうち、どれが必須ゲートチェックを受けるべきか？」）
      - Depth calibration (e.g., "Is this a lightweight pre-commit sanity list or a formal release gate?")
        深度調整（例：「これは軽量なプレコミットサニティリストか、正式なリリースゲートか？」）
      - Audience framing (e.g., "Will this be used by the author only or peers during PR review?")
        対象者フレーミング（例：「これは作成者のみが使用するか、PRレビュー中に同僚が使用するか？」）
      - Boundary exclusion (e.g., "Should we explicitly exclude performance tuning items this round?")
        境界除外（例：「今回はパフォーマンスチューニング項目を明示的に除外すべきか？」）
      - Scenario class gap (e.g., "No recovery flows detected—are rollback / partial failure paths in scope?")
        シナリオクラスギャップ（例：「リカバリーフローが検出されません—ロールバック/部分失敗パスはスコープ内か？」）

   Question formatting rules:
   
   質問フォーマットルール：
   
   - If presenting options, generate a compact table with columns: Option | Candidate | Why It Matters
     選択肢を提示する場合、以下の列でコンパクトテーブルを生成：Option | Candidate | Why It Matters
   - Limit to A–E options maximum; omit table if a free-form answer is clearer
     最大A-E選択肢に制限；自由形式回答がより明確な場合はテーブルを省略
   - Never ask the user to restate what they already said
     ユーザーが既に述べたことを再度述べるよう決して求めない
   - Avoid speculative categories (no hallucination). If uncertain, ask explicitly: "Confirm whether X belongs in scope."
     投機的カテゴリを避ける（幻覚なし）。不確実な場合は明示的に質問：「Xがスコープ内に属するか確認してください」

   Defaults when interaction impossible:
   
   相互作用が不可能な場合のデフォルト：
   
   - Depth: Standard / 深度：標準
   - Audience: Reviewer (PR) if code-related; Author otherwise / 対象者：コード関連の場合はレビュアー（PR）；そうでなければ作成者
   - Focus: Top 2 relevance clusters / フォーカス：上位2つの関連クラスター

   Output the questions (label Q1/Q2/Q3). After answers: if ≥2 scenario classes (Alternate / Exception / Recovery / Non-Functional domain) remain unclear, you MAY ask up to TWO more targeted follow‑ups (Q4/Q5) with a one-line justification each (e.g., "Unresolved recovery path risk"). Do not exceed five total questions. Skip escalation if user explicitly declines more.

   質問を出力（Q1/Q2/Q3とラベル付け）。回答後：≥2つのシナリオクラス（代替/例外/リカバリー/非機能ドメイン）が不明確なままの場合、それぞれ一行の正当化（例：「未解決のリカバリーパスリスク」）で最大2つの追加ターゲット質問（Q4/Q5）を行うことができます。総質問数は5つを超えないでください。ユーザーが明示的により多くを拒否した場合はエスカレーションをスキップしてください。

3. **Understand user request**: Combine `$ARGUMENTS` + clarifying answers:
   - Derive checklist theme (e.g., security, review, deploy, ux)
   - Consolidate explicit must-have items mentioned by user
   - Map focus selections to category scaffolding
   - Infer any missing context from spec/plan/tasks (do NOT hallucinate)

   **ユーザー要求の理解**：`$ARGUMENTS` + 明確化回答を組み合わせ：
   - チェックリストテーマを導出（例：security、review、deploy、ux）
   - ユーザーが言及した明示的必須項目を統合
   - フォーカス選択をカテゴリー足場にマップ
   - spec/plan/tasksから不足コンテキストを推論（幻覚しない）

4. **Load feature context**: Read from FEATURE_DIR:
   - spec.md: Feature requirements and scope
   - plan.md (if exists): Technical details, dependencies
   - tasks.md (if exists): Implementation tasks

   **機能コンテキストの読み込み**：FEATURE_DIRから読み取り：
   - spec.md: 機能要件とスコープ
   - plan.md（存在する場合）: 技術詳細、依存関係
   - tasks.md（存在する場合）: 実装タスク
   
   **Context Loading Strategy**:
   - Load only necessary portions relevant to active focus areas (avoid full-file dumping)
   - Prefer summarizing long sections into concise scenario/requirement bullets
   - Use progressive disclosure: add follow-on retrieval only if gaps detected
   - If source docs are large, generate interim summary items instead of embedding raw text

   **コンテキスト読み込み戦略**：
   - アクティブフォーカス領域に関連する必要部分のみ読み込み（全ファイルダンプを避ける）
   - 長いセクションを簡潔なシナリオ/要件箇条書きに要約することを優先
   - 段階的開示を使用：ギャップが検出された場合のみフォローアップ取得を追加
   - ソース文書が大きい場合、生テキストを埋め込む代わりに中間要約項目を生成

5. **Generate checklist** - Create "Unit Tests for Requirements":
   - Create `FEATURE_DIR/checklists/` directory if it doesn't exist
   - Generate unique checklist filename:
     - Use short, descriptive name based on domain (e.g., `ux.md`, `api.md`, `security.md`)
     - Format: `[domain].md` 
     - If file exists, append to existing file
   - Number items sequentially starting from CHK001
   - Each `/speckit.checklist` run creates a NEW file (never overwrites existing checklists)

   **チェックリスト生成** - 「要件のための単体テスト」を作成：
   - 存在しない場合は`FEATURE_DIR/checklists/`ディレクトリを作成
   - 一意のチェックリストファイル名を生成：
     - ドメインに基づく短く説明的な名前を使用（例：`ux.md`、`api.md`、`security.md`）
     - 形式：`[domain].md`
     - ファイルが存在する場合、既存ファイルに追加
   - CHK001から始まる連番で項目に番号付け
   - 各`/speckit.checklist`実行は新しいファイルを作成（既存チェックリストを上書きしない）

   **CORE PRINCIPLE - Test the Requirements, Not the Implementation**:
   Every checklist item MUST evaluate the REQUIREMENTS THEMSELVES for:
   - **Completeness**: Are all necessary requirements present?
   - **Clarity**: Are requirements unambiguous and specific?
   - **Consistency**: Do requirements align with each other?
   - **Measurability**: Can requirements be objectively verified?
   - **Coverage**: Are all scenarios/edge cases addressed?

   **中核原則 - 実装ではなく要件をテスト**：
   すべてのチェックリスト項目は要件自体を以下について評価する必要があります：
   - **完全性**：すべての必要な要件が存在するか？
   - **明確性**：要件は明確で具体的か？
   - **一貫性**：要件は互いに整合しているか？
   - **測定可能性**：要件は客観的に検証できるか？
   - **カバレッジ**：すべてのシナリオ/エッジケースが対処されているか？
   
   **Category Structure** - Group items by requirement quality dimensions:
   - **Requirement Completeness** (Are all necessary requirements documented?)
   - **Requirement Clarity** (Are requirements specific and unambiguous?)
   - **Requirement Consistency** (Do requirements align without conflicts?)
   - **Acceptance Criteria Quality** (Are success criteria measurable?)
   - **Scenario Coverage** (Are all flows/cases addressed?)
   - **Edge Case Coverage** (Are boundary conditions defined?)
   - **Non-Functional Requirements** (Performance, Security, Accessibility, etc. - are they specified?)
   - **Dependencies & Assumptions** (Are they documented and validated?)
   - **Ambiguities & Conflicts** (What needs clarification?)

   **カテゴリー構造** - 要件品質次元でアイテムをグループ化：
   - **要件完全性**（すべての必要な要件が文書化されているか？）
   - **要件明確性**（要件は具体的で明確か？）
   - **要件一貫性**（要件は競合なく整合しているか？）
   - **受け入れ基準品質**（成功基準は測定可能か？）
   - **シナリオカバレッジ**（すべてのフロー/ケースが対処されているか？）
   - **エッジケースカバレッジ**（境界条件が定義されているか？）
   - **非機能要件**（パフォーマンス、セキュリティ、アクセシビリティなど - 指定されているか？）
   - **依存関係と仮定**（文書化され検証されているか？）
   - **曖昧さと競合**（何が明確化を必要とするか？）
   
   **HOW TO WRITE CHECKLIST ITEMS - "Unit Tests for English"**:

   **チェックリスト項目の書き方 - 「英語のための単体テスト」**：
   
   ❌ **WRONG** (Testing implementation):
   - "Verify landing page displays 3 episode cards"
   - "Test hover states work on desktop"
   - "Confirm logo click navigates home"

   ❌ **間違い**（実装のテスト）：
   - "ランディングページが3つのエピソードカードを表示することを確認"
   - "デスクトップでホバー状態が動作することをテスト"
   - "ロゴクリックがホームにナビゲートすることを確認"
   
   ✅ **CORRECT** (Testing requirements quality):
   - "Are the exact number and layout of featured episodes specified?" [Completeness]
   - "Is 'prominent display' quantified with specific sizing/positioning?" [Clarity]
   - "Are hover state requirements consistent across all interactive elements?" [Consistency]
   - "Are keyboard navigation requirements defined for all interactive UI?" [Coverage]
   - "Is the fallback behavior specified when logo image fails to load?" [Edge Cases]
   - "Are loading states defined for asynchronous episode data?" [Completeness]
   - "Does the spec define visual hierarchy for competing UI elements?" [Clarity]

   ✅ **正しい**（要件品質のテスト）：
   - "注目エピソードの正確な数とレイアウトが指定されているか？" [完全性]
   - "『目立つ表示』が具体的なサイズ/位置で定量化されているか？" [明確性]
   - "ホバー状態要件がすべてのインタラクティブ要素で一貫しているか？" [一貫性]
   - "すべてのインタラクティブUIでキーボードナビゲーション要件が定義されているか？" [カバレッジ]
   - "ロゴ画像の読み込みが失敗した場合のフォールバック動作が指定されているか？" [エッジケース]
   - "非同期エピソードデータの読み込み状態が定義されているか？" [完全性]
   - "仕様で競合するUI要素の視覚的階層が定義されているか？" [明確性]
   
   **ITEM STRUCTURE**:
   Each item should follow this pattern:
   - Question format asking about requirement quality
   - Focus on what's WRITTEN (or not written) in the spec/plan
   - Include quality dimension in brackets [Completeness/Clarity/Consistency/etc.]
   - Reference spec section `[Spec §X.Y]` when checking existing requirements
   - Use `[Gap]` marker when checking for missing requirements

   **項目構造**：
   各項目は以下のパターンに従う必要があります：
   - 要件品質について尋ねる質問形式
   - 仕様/計画で書かれている（または書かれていない）ことに焦点
   - 品質次元を角括弧で含める [完全性/明確性/一貫性/など]
   - 既存要件をチェックする際は仕様セクション`[Spec §X.Y]`を参照
   - 不足要件をチェックする際は`[Gap]`マーカーを使用
   
   **EXAMPLES BY QUALITY DIMENSION**:

   **品質次元別の例**：
   
   Completeness:
   - "Are error handling requirements defined for all API failure modes? [Gap]"
   - "Are accessibility requirements specified for all interactive elements? [Completeness]"
   - "Are mobile breakpoint requirements defined for responsive layouts? [Gap]"

   完全性：
   - "すべてのAPI失敗モードに対してエラーハンドリング要件が定義されているか？ [Gap]"
   - "すべてのインタラクティブ要素にアクセシビリティ要件が指定されているか？ [完全性]"
   - "レスポンシブレイアウトのモバイルブレイクポイント要件が定義されているか？ [Gap]"
   
   Clarity:
   - "Is 'fast loading' quantified with specific timing thresholds? [Clarity, Spec §NFR-2]"
   - "Are 'related episodes' selection criteria explicitly defined? [Clarity, Spec §FR-5]"
   - "Is 'prominent' defined with measurable visual properties? [Ambiguity, Spec §FR-4]"

   明確性：
   - "『高速読み込み』が具体的なタイミング閾値で定量化されているか？ [明確性, Spec §NFR-2]"
   - "『関連エピソード』の選択基準が明示的に定義されているか？ [明確性, Spec §FR-5]"
   - "『目立つ』が測定可能な視覚的プロパティで定義されているか？ [曖昧性, Spec §FR-4]"
   
   Consistency:
   - "Do navigation requirements align across all pages? [Consistency, Spec §FR-10]"
   - "Are card component requirements consistent between landing and detail pages? [Consistency]"

   一貫性：
   - "ナビゲーション要件がすべてのページで整合しているか？ [一貫性, Spec §FR-10]"
   - "カードコンポーネント要件がランディングページと詳細ページ間で一貫しているか？ [一貫性]"
   
   Coverage:
   - "Are requirements defined for zero-state scenarios (no episodes)? [Coverage, Edge Case]"
   - "Are concurrent user interaction scenarios addressed? [Coverage, Gap]"
   - "Are requirements specified for partial data loading failures? [Coverage, Exception Flow]"

   カバレッジ：
   - "ゼロ状態シナリオ（エピソードなし）の要件が定義されているか？ [カバレッジ, エッジケース]"
   - "同時ユーザーインタラクションシナリオが対処されているか？ [カバレッジ, Gap]"
   - "部分的データ読み込み失敗の要件が指定されているか？ [カバレッジ, 例外フロー]"
   
   Measurability:
   - "Are visual hierarchy requirements measurable/testable? [Acceptance Criteria, Spec §FR-1]"
   - "Can 'balanced visual weight' be objectively verified? [Measurability, Spec §FR-2]"

   測定可能性：
   - "視覚的階層要件は測定可能/テスト可能か？ [受け入れ基準, Spec §FR-1]"
   - "『バランスの取れた視覚的重み』は客観的に検証できるか？ [測定可能性, Spec §FR-2]"

   **Scenario Classification & Coverage** (Requirements Quality Focus):
   - Check if requirements exist for: Primary, Alternate, Exception/Error, Recovery, Non-Functional scenarios
   - For each scenario class, ask: "Are [scenario type] requirements complete, clear, and consistent?"
   - If scenario class missing: "Are [scenario type] requirements intentionally excluded or missing? [Gap]"
   - Include resilience/rollback when state mutation occurs: "Are rollback requirements defined for migration failures? [Gap]"

   **シナリオ分類とカバレッジ**（要件品質フォーカス）：
   - 以下の要件が存在するかチェック：プライマリ、代替、例外/エラー、リカバリー、非機能シナリオ
   - 各シナリオクラスについて質問：「[シナリオタイプ]要件は完全で、明確で、一貫しているか？」
   - シナリオクラスが不足している場合：「[シナリオタイプ]要件は意図的に除外されているか、不足しているか？ [Gap]」
   - 状態変更が発生する場合はレジリエンス/ロールバックを含める：「移行失敗に対するロールバック要件が定義されているか？ [Gap]」

   **Traceability Requirements**:
   - MINIMUM: ≥80% of items MUST include at least one traceability reference
   - Each item should reference: spec section `[Spec §X.Y]`, or use markers: `[Gap]`, `[Ambiguity]`, `[Conflict]`, `[Assumption]`
   - If no ID system exists: "Is a requirement & acceptance criteria ID scheme established? [Traceability]"

   **トレーサビリティ要件**：
   - 最小限：≥80%の項目が少なくとも1つのトレーサビリティ参照を含む必要がある
   - 各項目は以下を参照すべき：仕様セクション`[Spec §X.Y]`、またはマーカーを使用：`[Gap]`、`[Ambiguity]`、`[Conflict]`、`[Assumption]`
   - IDシステムが存在しない場合：「要件と受け入れ基準のIDスキームが確立されているか？ [トレーサビリティ]」

   **Surface & Resolve Issues** (Requirements Quality Problems):
   Ask questions about the requirements themselves:
   - Ambiguities: "Is the term 'fast' quantified with specific metrics? [Ambiguity, Spec §NFR-1]"
   - Conflicts: "Do navigation requirements conflict between §FR-10 and §FR-10a? [Conflict]"
   - Assumptions: "Is the assumption of 'always available podcast API' validated? [Assumption]"
   - Dependencies: "Are external podcast API requirements documented? [Dependency, Gap]"
   - Missing definitions: "Is 'visual hierarchy' defined with measurable criteria? [Gap]"

   **問題の発見と解決**（要件品質問題）：
   要件自体について質問する：
   - 曖昧さ：「『高速』という用語が具体的なメトリクスで定量化されているか？ [曖昧性, Spec §NFR-1]」
   - 競合：「ナビゲーション要件が§FR-10と§FR-10a間で競合しているか？ [競合]」
   - 仮定：「『常に利用可能なポッドキャストAPI』の仮定が検証されているか？ [仮定]」
   - 依存関係：「外部ポッドキャストAPI要件が文書化されているか？ [依存関係, Gap]」
   - 定義の不足：「『視覚的階層』が測定可能な基準で定義されているか？ [Gap]」

   **Content Consolidation**:
   - Soft cap: If raw candidate items > 40, prioritize by risk/impact
   - Merge near-duplicates checking the same requirement aspect
   - If >5 low-impact edge cases, create one item: "Are edge cases X, Y, Z addressed in requirements? [Coverage]"

   **コンテンツ統合**：
   - ソフトキャップ：生の候補項目が40を超える場合、リスク/影響で優先順位付け
   - 同じ要件側面をチェックするほぼ重複項目をマージ
   - 5つ以上の低影響エッジケースがある場合、1つの項目を作成：「エッジケースX、Y、Zが要件で対処されているか？ [カバレッジ]」

   **🚫 ABSOLUTELY PROHIBITED** - These make it an implementation test, not a requirements test:
   - ❌ Any item starting with "Verify", "Test", "Confirm", "Check" + implementation behavior
   - ❌ References to code execution, user actions, system behavior
   - ❌ "Displays correctly", "works properly", "functions as expected"
   - ❌ "Click", "navigate", "render", "load", "execute"
   - ❌ Test cases, test plans, QA procedures
   - ❌ Implementation details (frameworks, APIs, algorithms)

   **🚫 絶対禁止** - これらは要件テストではなく実装テストにしてしまいます：
   - ❌ 「確認」、「テスト」、「コンファーム」、「チェック」+ 実装動作で始まる項目
   - ❌ コード実行、ユーザーアクション、システム動作への参照
   - ❌ 「正しく表示される」、「適切に動作する」、「期待通りに機能する」
   - ❌ 「クリック」、「ナビゲート」、「レンダー」、「ロード」、「実行」
   - ❌ テストケース、テスト計画、QA手順
   - ❌ 実装詳細（フレームワーク、API、アルゴリズム）
   
   **✅ REQUIRED PATTERNS** - These test requirements quality:
   - ✅ "Are [requirement type] defined/specified/documented for [scenario]?"
   - ✅ "Is [vague term] quantified/clarified with specific criteria?"
   - ✅ "Are requirements consistent between [section A] and [section B]?"
   - ✅ "Can [requirement] be objectively measured/verified?"
   - ✅ "Are [edge cases/scenarios] addressed in requirements?"
   - ✅ "Does the spec define [missing aspect]?"

   **✅ 必須パターン** - これらは要件品質をテストします：
   - ✅ 「[シナリオ]に対して[要件タイプ]が定義/指定/文書化されているか？」
   - ✅ 「[曖昧な用語]が具体的基準で定量化/明確化されているか？」
   - ✅ 「[セクションA]と[セクションB]間で要件が一貫しているか？」
   - ✅ 「[要件]は客観的に測定/検証できるか？」
   - ✅ 「[エッジケース/シナリオ]が要件で対処されているか？」
   - ✅ 「仕様で[不足側面]が定義されているか？」

6. **Structure Reference**: Generate the checklist following the canonical template in `templates/checklist-template.md` for title, meta section, category headings, and ID formatting. If template is unavailable, use: H1 title, purpose/created meta lines, `##` category sections containing `- [ ] CHK### <requirement item>` lines with globally incrementing IDs starting at CHK001.

   **構造参照**：タイトル、メタセクション、カテゴリー見出し、ID形式について`templates/checklist-template.md`の正規テンプレートに従ってチェックリストを生成します。テンプレートが利用できない場合は、H1タイトル、目的/作成メタライン、CHK001から始まるグローバル増分IDを持つ`- [ ] CHK### <要件項目>`行を含む`##`カテゴリーセクションを使用します。

7. **Report**: Output full path to created checklist, item count, and remind user that each run creates a new file. Summarize:
   - Focus areas selected
   - Depth level
   - Actor/timing
   - Any explicit user-specified must-have items incorporated

   **レポート**：作成されたチェックリストへのフルパス、項目数を出力し、各実行が新しいファイルを作成することをユーザーに思い出させます。要約：
   - 選択されたフォーカス領域
   - 深度レベル
   - アクター/タイミング
   - 組み込まれたユーザー指定の明示的必須項目

**Important**: Each `/speckit.checklist` command invocation creates a checklist file using short, descriptive names unless file already exists. This allows:

**重要**：各`/speckit.checklist`コマンド実行は、ファイルが既に存在しない限り、短く説明的な名前を使用してチェックリストファイルを作成します。これにより以下が可能になります：

- Multiple checklists of different types (e.g., `ux.md`, `test.md`, `security.md`)
- Simple, memorable filenames that indicate checklist purpose
- Easy identification and navigation in the `checklists/` folder

- 異なるタイプの複数チェックリスト（例：`ux.md`、`test.md`、`security.md`）
- チェックリストの目的を示すシンプルで覚えやすいファイル名
- `checklists/`フォルダでの簡単な識別とナビゲーション

To avoid clutter, use descriptive types and clean up obsolete checklists when done.

散らかりを避けるため、説明的なタイプを使用し、完了時に古いチェックリストをクリーンアップしてください。

## Example Checklist Types & Sample Items / チェックリストタイプと項目例

**UX Requirements Quality:** `ux.md`

**UX要件品質：** `ux.md`

Sample items (testing the requirements, NOT the implementation):
- "Are visual hierarchy requirements defined with measurable criteria? [Clarity, Spec §FR-1]"
- "Is the number and positioning of UI elements explicitly specified? [Completeness, Spec §FR-1]"
- "Are interaction state requirements (hover, focus, active) consistently defined? [Consistency]"
- "Are accessibility requirements specified for all interactive elements? [Coverage, Gap]"
- "Is fallback behavior defined when images fail to load? [Edge Case, Gap]"
- "Can 'prominent display' be objectively measured? [Measurability, Spec §FR-4]"

サンプル項目（実装ではなく要件をテスト）：
- "視覚的階層要件が測定可能な基準で定義されているか？ [明確性, Spec §FR-1]"
- "UI要素の数と位置が明示的に指定されているか？ [完全性, Spec §FR-1]"
- "インタラクション状態要件（ホバー、フォーカス、アクティブ）が一貫して定義されているか？ [一貫性]"
- "すべてのインタラクティブ要素にアクセシビリティ要件が指定されているか？ [カバレッジ, Gap]"
- "画像の読み込みが失敗した場合のフォールバック動作が定義されているか？ [エッジケース, Gap]"
- "『目立つ表示』は客観的に測定できるか？ [測定可能性, Spec §FR-4]"

**API Requirements Quality:** `api.md`

**API要件品質：** `api.md`

Sample items:
- "Are error response formats specified for all failure scenarios? [Completeness]"
- "Are rate limiting requirements quantified with specific thresholds? [Clarity]"
- "Are authentication requirements consistent across all endpoints? [Consistency]"
- "Are retry/timeout requirements defined for external dependencies? [Coverage, Gap]"
- "Is versioning strategy documented in requirements? [Gap]"

サンプル項目：
- "すべての失敗シナリオに対してエラー応答形式が指定されているか？ [完全性]"
- "レート制限要件が具体的な閾値で定量化されているか？ [明確性]"
- "すべてのエンドポイントで認証要件が一貫しているか？ [一貫性]"
- "外部依存関係に対してリトライ/タイムアウト要件が定義されているか？ [カバレッジ, Gap]"
- "バージョニング戦略が要件で文書化されているか？ [Gap]"

**Performance Requirements Quality:** `performance.md`

**パフォーマンス要件品質：** `performance.md`

Sample items:
- "Are performance requirements quantified with specific metrics? [Clarity]"
- "Are performance targets defined for all critical user journeys? [Coverage]"
- "Are performance requirements under different load conditions specified? [Completeness]"
- "Can performance requirements be objectively measured? [Measurability]"
- "Are degradation requirements defined for high-load scenarios? [Edge Case, Gap]"

サンプル項目：
- "パフォーマンス要件が具体的なメトリクスで定量化されているか？ [明確性]"
- "すべての重要なユーザージャーニーに対してパフォーマンス目標が定義されているか？ [カバレッジ]"
- "異なる負荷条件下でのパフォーマンス要件が指定されているか？ [完全性]"
- "パフォーマンス要件は客観的に測定できるか？ [測定可能性]"
- "高負荷シナリオに対する劣化要件が定義されているか？ [エッジケース, Gap]"

**Security Requirements Quality:** `security.md`

**セキュリティ要件品質：** `security.md`

Sample items:
- "Are authentication requirements specified for all protected resources? [Coverage]"
- "Are data protection requirements defined for sensitive information? [Completeness]"
- "Is the threat model documented and requirements aligned to it? [Traceability]"
- "Are security requirements consistent with compliance obligations? [Consistency]"
- "Are security failure/breach response requirements defined? [Gap, Exception Flow]"

サンプル項目：
- "すべての保護リソースに対して認証要件が指定されているか？ [カバレッジ]"
- "機密情報に対するデータ保護要件が定義されているか？ [完全性]"
- "脅威モデルが文書化され、要件がそれに整合しているか？ [トレーサビリティ]"
- "セキュリティ要件がコンプライアンス義務と一貫しているか？ [一貫性]"
- "セキュリティ失敗/侵害対応要件が定義されているか？ [Gap, 例外フロー]"

## Anti-Examples: What NOT To Do / 反例：やってはいけないこと

**❌ WRONG - These test implementation, not requirements:**

**❌ 間違い - これらは要件ではなく実装をテスト：**

```markdown
- [ ] CHK001 - Verify landing page displays 3 episode cards [Spec §FR-001]
- [ ] CHK002 - Test hover states work correctly on desktop [Spec §FR-003]
- [ ] CHK003 - Confirm logo click navigates to home page [Spec §FR-010]
- [ ] CHK004 - Check that related episodes section shows 3-5 items [Spec §FR-005]
```

```markdown
- [ ] CHK001 - ランディングページが3つのエピソードカードを表示することを確認 [Spec §FR-001]
- [ ] CHK002 - デスクトップでホバー状態が正しく動作することをテスト [Spec §FR-003]
- [ ] CHK003 - ロゴクリックがホームページにナビゲートすることを確認 [Spec §FR-010]
- [ ] CHK004 - 関連エピソードセクションが3-5項目を表示することをチェック [Spec §FR-005]
```

**✅ CORRECT - These test requirements quality:**

**✅ 正しい - これらは要件品質をテスト：**

```markdown
- [ ] CHK001 - Are the number and layout of featured episodes explicitly specified? [Completeness, Spec §FR-001]
- [ ] CHK002 - Are hover state requirements consistently defined for all interactive elements? [Consistency, Spec §FR-003]
- [ ] CHK003 - Are navigation requirements clear for all clickable brand elements? [Clarity, Spec §FR-010]
- [ ] CHK004 - Is the selection criteria for related episodes documented? [Gap, Spec §FR-005]
- [ ] CHK005 - Are loading state requirements defined for asynchronous episode data? [Gap]
- [ ] CHK006 - Can "visual hierarchy" requirements be objectively measured? [Measurability, Spec §FR-001]
```

```markdown
- [ ] CHK001 - 注目エピソードの数とレイアウトが明示的に指定されているか？ [完全性, Spec §FR-001]
- [ ] CHK002 - すべてのインタラクティブ要素でホバー状態要件が一貫して定義されているか？ [一貫性, Spec §FR-003]
- [ ] CHK003 - すべてのクリック可能なブランド要素でナビゲーション要件が明確か？ [明確性, Spec §FR-010]
- [ ] CHK004 - 関連エピソードの選択基準が文書化されているか？ [Gap, Spec §FR-005]
- [ ] CHK005 - 非同期エピソードデータの読み込み状態要件が定義されているか？ [Gap]
- [ ] CHK006 - 「視覚的階層」要件は客観的に測定できるか？ [測定可能性, Spec §FR-001]
```

**Key Differences:**
- Wrong: Tests if the system works correctly
- Correct: Tests if the requirements are written correctly
- Wrong: Verification of behavior
- Correct: Validation of requirement quality
- Wrong: "Does it do X?" 
- Correct: "Is X clearly specified?"

**主な違い：**
- 間違い：システムが正しく動作するかをテスト
- 正しい：要件が正しく書かれているかをテスト
- 間違い：動作の検証
- 正しい：要件品質の検証
- 間違い：「Xを実行するか？」
- 正しい：「Xが明確に指定されているか？」

