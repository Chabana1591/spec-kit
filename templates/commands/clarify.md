---
description: Identify underspecified areas in the current feature spec by asking up to 5 highly targeted clarification questions and encoding answers back into the spec. / 最大5つの高度にターゲットされた明確化質問により現在の機能仕様の不完全な領域を特定し、回答を仕様に記録
scripts:
   sh: scripts/bash/check-prerequisites.sh --json --paths-only
   ps: scripts/powershell/check-prerequisites.ps1 -Json -PathsOnly
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

Goal: Detect and reduce ambiguity or missing decision points in the active feature specification and record the clarifications directly in the spec file.

**目標**：アクティブな機能仕様の曖昧さや不足している決定ポイントを検出・削減し、明確化を仕様ファイルに直接記録します。

Note: This clarification workflow is expected to run (and be completed) BEFORE invoking `/speckit.plan`. If the user explicitly states they are skipping clarification (e.g., exploratory spike), you may proceed, but must warn that downstream rework risk increases.

**注**：この明確化ワークフローは`/speckit.plan`を実行する前に実行（完了）されることが期待されます。ユーザーが明示的に明確化をスキップすると述べた場合（例：探索スパイク）、進行可能ですが、下流での作り直しリスクが増加することを警告する必要があります。

Execution steps:
実行手順：

1. Run `{SCRIPT}` from repo root **once** (combined `--json --paths-only` mode / `-Json -PathsOnly`). Parse minimal JSON payload fields:
   リポジトリのルートで `{SCRIPT}` を**1回**実行します（`--json --paths-only` / `-Json -PathsOnly` の組み合わせモード）。JSON ペイロードから次の最小限のフィールドを解析します。
   - `FEATURE_DIR`
   - `FEATURE_SPEC`
   - (Optionally capture `IMPL_PLAN`, `TASKS` for future chained flows.)
     （将来の連鎖フローに備えて `IMPL_PLAN` や `TASKS` を任意で取得します。）
   - If JSON parsing fails, abort and instruct user to re-run `/speckit.specify` or verify feature branch environment.
     JSON の解析に失敗した場合は処理を中止し、ユーザーに `/speckit.specify` を再実行するか機能ブランチの環境を確認するよう指示します。
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").
     "I'm Groot" のように引数にシングルクォートを含む場合は `'I'\''m Groot'` のようなエスケープ構文を使用します（可能ならダブルクォート `"I'm Groot"` を利用してください）。

2. Load the current spec file. Perform a structured ambiguity & coverage scan using this taxonomy. For each category, mark status: Clear / Partial / Missing. Produce an internal coverage map used for prioritization (do not output raw map unless no questions will be asked).
   現在の仕様ファイルを読み込み、この分類法に従って体系的な曖昧さとカバレッジのスキャンを実施します。各カテゴリのステータスを Clear / Partial / Missing で記録し、優先度付けに用いる内部カバレッジマップを作成します（質問を提示しない場合を除き、生のマップは出力しません）。

   Functional Scope & Behavior:
   機能範囲と振る舞い：
   - Core user goals & success criteria
     中核となるユーザーゴールと成功基準
   - Explicit out-of-scope declarations
     明示的なスコープ外の宣言
   - User roles / personas differentiation
     ユーザーロール／ペルソナの区別

   Domain & Data Model:
   ドメインとデータモデル：
   - Entities, attributes, relationships
     エンティティ、属性、リレーションシップ
   - Identity & uniqueness rules
     識別子と一意性に関するルール
   - Lifecycle/state transitions
     ライフサイクル／状態遷移
   - Data volume / scale assumptions
     データ量／スケールに関する前提

   Interaction & UX Flow:
   インタラクションと UX フロー：
   - Critical user journeys / sequences
     重要なユーザージャーニー／シーケンス
   - Error/empty/loading states
     エラー／空状態／読み込み時の状態
   - Accessibility or localization notes
     アクセシビリティまたはローカライズに関する注意事項

   Non-Functional Quality Attributes:
   非機能的な品質属性：
   - Performance (latency, throughput targets)
     性能（レイテンシ、スループット目標）
   - Scalability (horizontal/vertical, limits)
     スケーラビリティ（水平・垂直、制限値）
   - Reliability & availability (uptime, recovery expectations)
     信頼性と可用性（稼働率、復旧の期待値）
   - Observability (logging, metrics, tracing signals)
     可観測性（ログ、メトリクス、トレーシングシグナル）
   - Security & privacy (authN/Z, data protection, threat assumptions)
     セキュリティとプライバシー（認証／認可、データ保護、想定脅威）
   - Compliance / regulatory constraints (if any)
     コンプライアンス／規制上の制約（該当する場合）

   Integration & External Dependencies:
   統合と外部依存関係：
   - External services/APIs and failure modes
     外部サービス／API と障害モード
   - Data import/export formats
     データのインポート／エクスポート形式
   - Protocol/versioning assumptions
     プロトコル／バージョン管理に関する前提

   Edge Cases & Failure Handling:
   エッジケースと障害対応：
   - Negative scenarios
     ネガティブシナリオ
   - Rate limiting / throttling
     レート制限／スロットリング
   - Conflict resolution (e.g., concurrent edits)
     競合解決（例：同時編集）

   Constraints & Tradeoffs:
   制約とトレードオフ：
   - Technical constraints (language, storage, hosting)
     技術的制約（言語、ストレージ、ホスティング）
   - Explicit tradeoffs or rejected alternatives
     明示的なトレードオフや却下された代替案

   Terminology & Consistency:
   用語と整合性：
   - Canonical glossary terms
     正準的な用語集の用語
   - Avoided synonyms / deprecated terms
     回避すべき同義語／廃止予定の用語

   Completion Signals:
   完了シグナル：
   - Acceptance criteria testability
     受け入れ基準のテスタビリティ
   - Measurable Definition of Done style indicators
     測定可能な Definition of Done 形式の指標

   Misc / Placeholders:
   その他／プレースホルダー：
   - TODO markers / unresolved decisions
     TODO マーカー／未決定事項
   - Ambiguous adjectives ("robust", "intuitive") lacking quantification
     定量化されていない曖昧な形容詞（例：「堅牢」「直感的」）

   For each category with Partial or Missing status, add a candidate question opportunity unless:
   Partial または Missing のステータスが付いた各カテゴリについては、次の場合を除き、候補となる質問を追加します。
   - Clarification would not materially change implementation or validation strategy
     明確化しても実装や検証の戦略が実質的に変わらない場合
   - Information is better deferred to planning phase (note internally)
     情報を計画フェーズまで先送りした方が良い場合（内部メモを残す）

3. Generate (internally) a prioritized queue of candidate clarification questions (maximum 5). Do NOT output them all at once. Apply these constraints:
   最大5件の明確化質問候補を内部で優先度付きキューとして生成します。一度にすべて出力しないでください。以下の制約を適用します。
    - Maximum of 10 total questions across the whole session.
      セッション全体で扱える質問は合計10件までです。
    - Each question must be answerable with EITHER:
      各質問は次のいずれかの形式で回答可能でなければなりません。
       * A short multiple‑choice selection (2–5 distinct, mutually exclusive options), OR
         短い選択式（2〜5個の相互排他的な選択肢）
       * A one-word / short‑phrase answer (explicitly constrain: "Answer in <=5 words").
         1語または短いフレーズでの回答（明示的に「5語以内で回答してください」と制約する）
   - Only include questions whose answers materially impact architecture, data modeling, task decomposition, test design, UX behavior, operational readiness, or compliance validation.
     アーキテクチャ、データモデリング、タスク分解、テスト設計、UX の挙動、運用準備、コンプライアンス検証に実質的な影響を与える回答が得られる質問のみを含めます。
   - Ensure category coverage balance: attempt to cover the highest impact unresolved categories first; avoid asking two low-impact questions when a single high-impact area (e.g., security posture) is unresolved.
     カテゴリ間のバランスを確保してください。影響度の高い未解決カテゴリを優先的に取り上げ、影響が低い質問を複数投げる代わりに高影響領域（例：セキュリティ体制）の解消を優先します。
   - Exclude questions already answered, trivial stylistic preferences, or plan-level execution details (unless blocking correctness).
     既に回答済みの内容、些細なスタイルの好み、計画レベルの実行詳細（正確性を妨げない限り）は除外します。
   - Favor clarifications that reduce downstream rework risk or prevent misaligned acceptance tests.
     下流での手戻りリスクを低減し、受け入れテストの不整合を防ぐ明確化を優先します。
   - If more than 5 categories remain unresolved, select the top 5 by (Impact * Uncertainty) heuristic.
     未解決カテゴリが5つを超える場合は、影響度×不確実性のヒューリスティックで上位5件を選択します。

4. Sequential questioning loop (interactive):
   逐次的な質問ループ（対話式）：
    - Present EXACTLY ONE question at a time.
      1度に提示する質問は必ず1つだけにします。
    - For multiple‑choice questions:
      選択式の質問を扱う場合：
       * **Analyze all options** and determine the **most suitable option** based on:
         **すべての選択肢を分析**し、次の基準に基づいて**最適な選択肢**を判断します。
          - Best practices for the project type
            対象プロジェクトタイプにおけるベストプラクティス
          - Common patterns in similar implementations
            類似実装で一般的なパターン
          - Risk reduction (security, performance, maintainability)
            リスク低減（セキュリティ、性能、保守性）
          - Alignment with any explicit project goals or constraints visible in the spec
            仕様に明示されたプロジェクト目標や制約との整合性
       * Present your **recommended option prominently** at the top with clear reasoning (1-2 sentences explaining why this is the best choice).
         明確な理由（1〜2文で十分）とともに、**推奨する選択肢**を先頭に目立たせて提示します。
       * Format as: `**Recommended:** Option [X] - <reasoning>`
         表記例：`**Recommended:** Option [X] - <reasoning>`
       * Then render all options as a Markdown table:
         続いてすべての選択肢を Markdown の表で提示します。

       | Option | Description |
       |--------|-------------|
       | A | <Option A description> |
       | B | <Option B description> |
       | C | <Option C description> | (add D/E as needed up to 5)
       | Short | Provide a different short answer (<=5 words) | (Include only if free-form alternative is appropriate)

         表の各行に選択肢の記号と説明を記載し、必要に応じて Short 行で自由回答（5語以内）の選択肢を提供します。
       * After the table, add: `You can reply with the option letter (e.g., "A"), accept the recommendation by saying "yes" or "recommended", or provide your own short answer.`
         表の後には次の文言を付加します：`You can reply with the option letter (e.g., "A"), accept the recommendation by saying "yes" or "recommended", or provide your own short answer.`
    - For short‑answer style (no meaningful discrete options):
      有効な離散選択肢が存在しない場合の短文回答スタイルでは：
       * Provide your **suggested answer** based on best practices and context.
         ベストプラクティスと文脈に基づき、**提案する回答**を提示します。
       * Format as: `**Suggested:** <your proposed answer> - <brief reasoning>`
         表記例：`**Suggested:** <your proposed answer> - <brief reasoning>`
       * Then output: `Format: Short answer (<=5 words). You can accept the suggestion by saying "yes" or "suggested", or provide your own answer.`
         その後に次の文言を出力します：`Format: Short answer (<=5 words). You can accept the suggestion by saying "yes" or "suggested", or provide your own answer.`
    - After the user answers:
      ユーザーが回答した後は次の手順を踏みます。
       * If the user replies with "yes", "recommended", or "suggested", use your previously stated recommendation/suggestion as the answer.
         ユーザーが "yes"、"recommended"、"suggested" と返答した場合は、事前に提示した推奨／提案を回答として採用します。
       * Otherwise, validate the answer maps to one option or fits the <=5 word constraint.
         それ以外の場合は、回答がいずれかの選択肢に対応するか、5語以内の制約を満たすかを検証します。
       * If ambiguous, ask for a quick disambiguation (count still belongs to same question; do not advance).
         あいまいであれば簡潔な再確認を行います（同じ質問としてカウントし、次に進めません）。
       * Once satisfactory, record it in working memory (do not yet write to disk) and move to the next queued question.
         妥当な回答が得られたらワーキングメモリに記録し（まだファイルには書き込みません）、キューの次の質問に移ります。
    - Stop asking further questions when:
      次のいずれかに該当したら質問を終了します。
       * All critical ambiguities resolved early (remaining queued items become unnecessary), OR
         重大な曖昧さがすべて早期に解消され、残りのキュー項目が不要になった場合
       * User signals completion ("done", "good", "no more"), OR
         ユーザーが「done」「good」「no more」などで完了を示した場合
       * You reach 5 asked questions.
         5件の質問を行った場合
    - Never reveal future queued questions in advance.
      キューに控えている質問を先出ししてはいけません。
    - If no valid questions exist at start, immediately report no critical ambiguities.
      有効な質問が最初から存在しない場合は、重大な曖昧さがないことを即座に報告します。

5. Integration after EACH accepted answer (incremental update approach):
   各回答を承認するたびに行う統合手順（逐次更新アプローチ）：
    - Maintain in-memory representation of the spec (loaded once at start) plus the raw file contents.
      仕様のメモリ内表現（開始時に読み込む）とファイルの生データを保持します。
    - For the first integrated answer in this session:
      セッションで最初の回答を統合する際には次を確認します。
       * Ensure a `## Clarifications` section exists (create it just after the highest-level contextual/overview section per the spec template if missing).
         `## Clarifications` セクションが存在するか確認し、なければ仕様テンプレートの最上位コンテキスト／概要セクション直後に作成します。
       * Under it, create (if not present) a `### Session YYYY-MM-DD` subheading for today.
         その直下に本日の日付で `### Session YYYY-MM-DD` の小見出しを（未設置の場合）作成します。
    - Append a bullet line immediately after acceptance: `- Q: <question> → A: <final answer>`.
      回答を受け入れたらすぐに `- Q: <question> → A: <final answer>` の箇条書きを追加します。
    - Then immediately apply the clarification to the most appropriate section(s):
      その後、明確化内容を該当するセクションへ即座に反映します。
       * Functional ambiguity → Update or add a bullet in Functional Requirements.
         機能面の曖昧さ → 機能要件セクションの箇条書きを更新または追加
       * User interaction / actor distinction → Update User Stories or Actors subsection (if present) with clarified role, constraint, or scenario.
         ユーザーインタラクション／アクターの区別 → ユーザーストーリーやアクター小節（存在する場合）に役割・制約・シナリオを追記
       * Data shape / entities → Update Data Model (add fields, types, relationships) preserving ordering; note added constraints succinctly.
         データ構造／エンティティ → データモデル（フィールド、型、リレーション）を順序を保ちつつ更新し、追加制約を簡潔に記載
       * Non-functional constraint → Add/modify measurable criteria in Non-Functional / Quality Attributes section (convert vague adjective to metric or explicit target).
         非機能要件 → 非機能／品質属性セクションで測定可能な基準を追加・修正し、曖昧な形容詞を指標や明確な目標に置き換える
       * Edge case / negative flow → Add a new bullet under Edge Cases / Error Handling (or create such subsection if template provides placeholder for it).
         エッジケース／負のフロー → エッジケース／エラーハンドリングに新しい箇条書きを追加（テンプレートにプレースホルダーがあれば小節を作成）
       * Terminology conflict → Normalize term across spec; retain original only if necessary by adding `(formerly referred to as "X")` once.
         用語の不整合 → 仕様全体で用語を正規化し、必要な場合のみ一度だけ `(formerly referred to as "X")` を添えて旧称を示す
    - If the clarification invalidates an earlier ambiguous statement, replace that statement instead of duplicating; leave no obsolete contradictory text.
      明確化により以前の曖昧な記述が無効になった場合は重複させず差し替え、矛盾する古い記述を残さないようにします。
    - Save the spec file AFTER each integration to minimize risk of context loss (atomic overwrite).
      各統合後に仕様ファイルを保存し、文脈喪失のリスクを最小限に抑えます（アトミックな上書き）。
    - Preserve formatting: do not reorder unrelated sections; keep heading hierarchy intact.
      フォーマットを保持し、無関係なセクションの順序を入れ替えず、見出し階層を保ちます。
    - Keep each inserted clarification minimal and testable (avoid narrative drift).
      追加する明確化は簡潔かつテスト可能な形に留め、冗長な記述に逸れないようにします。

6. Validation (performed after EACH write plus final pass):
   検証（各書き込み後と最終確認の双方で実施）：
   - Clarifications session contains exactly one bullet per accepted answer (no duplicates).
     Clarifications セクションでは受け入れた回答ごとに箇条書きが1つだけ存在し、重複がないこと。
   - Total asked (accepted) questions ≤ 5.
     質問（受け入れ済み）の総数が5件以下であること。
   - Updated sections contain no lingering vague placeholders the new answer was meant to resolve.
     更新されたセクションに、新しい解答で解消したはずの曖昧なプレースホルダーが残っていないこと。
   - No contradictory earlier statement remains (scan for now-invalid alternative choices removed).
     現在は無効となった矛盾した記述が残っていないこと（代替案が無効化された場合は削除）。
   - Markdown structure valid; only allowed new headings: `## Clarifications`, `### Session YYYY-MM-DD`.
     Markdown 構造が正しく、追加できる新しい見出しは `## Clarifications` と `### Session YYYY-MM-DD` のみであること。
   - Terminology consistency: same canonical term used across all updated sections.
     用語の整合性が保たれ、更新したすべてのセクションで同じ正規用語を使用していること。

7. Write the updated spec back to `FEATURE_SPEC`.
   更新した仕様を `FEATURE_SPEC` に書き戻します。

8. Report completion (after questioning loop ends or early termination):
   質問ループの終了後（または早期終了後）に結果を報告します。
   - Number of questions asked & answered.
     実施した質問と回答の件数。
   - Path to updated spec.
     更新した仕様ファイルのパス。
   - Sections touched (list names).
     更新したセクション名の一覧。
   - Coverage summary table listing each taxonomy category with Status: Resolved (was Partial/Missing and addressed), Deferred (exceeds question quota or better suited for planning), Clear (already sufficient), Outstanding (still Partial/Missing but low impact).
     各分類カテゴリを Status 列付きで列挙するカバレッジサマリー表（Resolved：Partial/Missing だったが解消済み、Deferred：質問枠超過や計画向きのため後回し、Clear：既に十分、Outstanding：低影響ながら未解決のまま）。
   - If any Outstanding or Deferred remain, recommend whether to proceed to `/speckit.plan` or run `/speckit.clarify` again later post-plan.
     Outstanding や Deferred が残る場合は、`/speckit.plan` に進むべきか、計画後に再度 `/speckit.clarify` を実行すべきかを推奨します。
   - Suggested next command.
     推奨する次のコマンド。

Behavior rules:
行動規範：
- If no meaningful ambiguities found (or all potential questions would be low-impact), respond: "No critical ambiguities detected worth formal clarification." and suggest proceeding.
  重大な曖昧さが見つからない（または質問候補がいずれも低影響）場合は `"No critical ambiguities detected worth formal clarification."` と返答し、次に進むよう提案します。
- If spec file missing, instruct user to run `/speckit.specify` first (do not create a new spec here).
  仕様ファイルが存在しない場合は新規作成せず、まず `/speckit.specify` を実行するようユーザーに指示します。
- Never exceed 5 total asked questions (clarification retries for a single question do not count as new questions).
  質問総数は決して5件を超えないようにします（1つの質問に対する再確認は追加でカウントしません）。
- Avoid speculative tech stack questions unless the absence blocks functional clarity.
  機能の明確化を妨げる場合を除き、推測に基づく技術スタックの質問は避けます。
- Respect user early termination signals ("stop", "done", "proceed").
  ユーザーからの早期終了シグナル（"stop"、"done"、"proceed" など）を尊重します。
 - If no questions asked due to full coverage, output a compact coverage summary (all categories Clear) then suggest advancing.
   カバレッジが十分で質問が不要な場合は、すべて Clear の簡潔なカバレッジサマリーを出力し、次に進むことを勧めます。
 - If quota reached with unresolved high-impact categories remaining, explicitly flag them under Deferred with rationale.
   質問上限に達したにもかかわらず高影響のカテゴリが未解決の場合は、理由とともに Deferred として明示的に示します。

Context for prioritization: {ARGS}
優先順位付けのためのコンテキスト：{ARGS}
