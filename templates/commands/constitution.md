---
description: Create or update the project constitution from interactive or provided principle inputs, ensuring all dependent templates stay in sync. / インタラクティブまたは提供された原則入力からプロジェクト憲法を作成・更新し、すべての依存テンプレートの同期を確保
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

You are updating the project constitution at `/memory/constitution.md`. This file is a TEMPLATE containing placeholder tokens in square brackets (e.g. `[PROJECT_NAME]`, `[PRINCIPLE_1_NAME]`). Your job is to (a) collect/derive concrete values, (b) fill the template precisely, and (c) propagate any amendments across dependent artifacts.

`/memory/constitution.md`のプロジェクト憲法を更新しています。このファイルは角括弧内のプレースホルダートークン（例：`[PROJECT_NAME]`、`[PRINCIPLE_1_NAME]`）を含むテンプレートです。あなたの仕事は（a）具体的な値を収集・導出し、（b）テンプレートを正確に記入し、（c）依存成果物に修正を伝播することです。

Follow this execution flow:

この実行フローに従ってください：

1. Load the existing constitution template at `/memory/constitution.md`.
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]`.
   **IMPORTANT**: The user might require less or more principles than the ones used in the template. If a number is specified, respect that - follow the general template. You will update the doc accordingly.

   `/memory/constitution.md`の既存憲法テンプレートを読み込みます。
   - `[ALL_CAPS_IDENTIFIER]`形式のすべてのプレースホルダートークンを特定します。
   **重要**：ユーザーはテンプレートで使用されているものより少ない、または多い原則を要求する場合があります。数が指定されている場合は、それを尊重し、一般的なテンプレートに従ってください。それに応じて文書を更新します。

2. Collect/derive values for placeholders:
   - If user input (conversation) supplies a value, use it.
   - Otherwise infer from existing repo context (README, docs, prior constitution versions if embedded).
   - For governance dates: `RATIFICATION_DATE` is the original adoption date (if unknown ask or mark TODO), `LAST_AMENDED_DATE` is today if changes are made, otherwise keep previous.
   - `CONSTITUTION_VERSION` must increment according to semantic versioning rules:
     * MAJOR: Backward incompatible governance/principle removals or redefinitions.
     * MINOR: New principle/section added or materially expanded guidance.
     * PATCH: Clarifications, wording, typo fixes, non-semantic refinements.
   - If version bump type ambiguous, propose reasoning before finalizing.

   プレースホルダーの値を収集・導出します：
   - ユーザー入力（会話）が値を提供する場合、それを使用します。
   - そうでなければ、既存のリポジトリコンテキスト（README、ドキュメント、埋め込まれた以前の憲法バージョン）から推測します。
   - ガバナンス日付について：`RATIFICATION_DATE`は元の採択日（不明な場合は質問またはTODOマーク）、`LAST_AMENDED_DATE`は変更が行われた場合は今日、そうでなければ以前のものを保持します。
   - `CONSTITUTION_VERSION`はセマンティックバージョニングルールに従って増分する必要があります：
     * MAJOR：後方互換しないガバナンス・原則の削除または再定義
     * MINOR：新しい原則・セクションの追加または実質的に拡張されたガイダンス
     * PATCH：明確化、文言、誤字修正、非セマンティック改良
   - バージョンバンプタイプが曖昧な場合、確定前に理由を提案します。

3. Draft the updated constitution content:
   - Replace every placeholder with concrete text (no bracketed tokens left except intentionally retained template slots that the project has chosen not to define yet—explicitly justify any left).
   - Preserve heading hierarchy and comments can be removed once replaced unless they still add clarifying guidance.
   - Ensure each Principle section: succinct name line, paragraph (or bullet list) capturing non‑negotiable rules, explicit rationale if not obvious.
   - Ensure Governance section lists amendment procedure, versioning policy, and compliance review expectations.

   更新された憲法コンテンツを作成します：
   - すべてのプレースホルダーを具体的なテキストに置き換えます（プロジェクトが意図的に未定義として残すテンプレートスロットを除き、角括弧付きトークンは残さず、残す場合は必ず理由を明記します）。
   - 見出しの階層を維持し、置き換え後に不要となったコメントは削除します（補足説明として価値がある場合は残してください）。
   - 各原則セクションには、簡潔な名称行、譲れないルールをまとめた段落（または箇条書き）、必要に応じて明示的な根拠を含めます。
   - ガバナンスセクションには、改訂手続き、バージョニング方針、遵守レビューに関する期待事項を必ず列挙します。

4. Consistency propagation checklist (convert prior checklist into active validations):
   - Read `/templates/plan-template.md` and ensure any "Constitution Check" or rules align with updated principles.
   - Read `/templates/spec-template.md` for scope/requirements alignment—update if constitution adds/removes mandatory sections or constraints.
   - Read `/templates/tasks-template.md` and ensure task categorization reflects new or removed principle-driven task types (e.g., observability, versioning, testing discipline).
   - Read each command file in `/templates/commands/*.md` (including this one) to verify no outdated references (agent-specific names like CLAUDE only) remain when generic guidance is required.
   - Read any runtime guidance docs (e.g., `README.md`, `docs/quickstart.md`, or agent-specific guidance files if present). Update references to principles changed.

   一貫性伝播のチェックリスト（従来のチェックリストを実際の検証項目として実行します）：
   - `/templates/plan-template.md`を読み、「Constitution Check」や規則が最新の原則と一致しているか確認します。
   - `/templates/spec-template.md`を読み、スコープや要件の整合性を確認します。憲法で必須セクションや制約が追加・削除された場合は更新します。
   - `/templates/tasks-template.md`を読み、タスク分類が新たに追加または削除された原則駆動のタスク種別（観測性、バージョニング、テスト規律など）を反映しているか確認します。
   - `/templates/commands/*.md`内の各コマンドファイル（このファイルを含む）を確認し、汎用的な指針が必要な箇所でエージェント固有の名称のみが残っていないか検証します。
   - ランタイムガイダンス文書（`README.md`、`docs/quickstart.md`、エージェント固有のガイダンスファイルなど）が存在する場合は読み、変更された原則への言及を更新します。

5. Produce a Sync Impact Report (prepend as an HTML comment at top of the constitution file after update):
   - Version change: old → new
   - List of modified principles (old title → new title if renamed)
   - Added sections
   - Removed sections
   - Templates requiring updates (✅ updated / ⚠ pending) with file paths
   - Follow-up TODOs if any placeholders intentionally deferred.

   同期影響レポートを作成します（更新後の憲法ファイル冒頭にHTMLコメントとして追記）：
   - バージョンの変更内容：旧 → 新
   - 修正した原則の一覧（名称変更がある場合は旧タイトル → 新タイトル）
   - 追加されたセクション
   - 削除されたセクション
   - 更新が必要なテンプレート（✅ 更新済み / ⚠ 未対応）とファイルパス
   - 意図的に保留したプレースホルダーがある場合のフォローアップTODO

6. Validation before final output:
   - No remaining unexplained bracket tokens.
   - Version line matches report.
   - Dates ISO format YYYY-MM-DD.
   - Principles are declarative, testable, and free of vague language ("should" → replace with MUST/SHOULD rationale where appropriate).

   最終出力前の検証：
   - 説明のない角括弧付きトークンが残っていないこと。
   - バージョンの記述がレポート内容と一致していること。
   - 日付がすべてYYYY-MM-DD形式であること。
   - 原則が宣言的で検証可能な文になっており、曖昧な表現（例：「should」）は適切にMUST/SHOULDなどへ置換されていること。

7. Write the completed constitution back to `/memory/constitution.md` (overwrite).

   完成した憲法を`/memory/constitution.md`に書き戻し、上書きします。

8. Output a final summary to the user with:
   - New version and bump rationale.
   - Any files flagged for manual follow-up.
   - Suggested commit message (e.g., `docs: amend constitution to vX.Y.Z (principle additions + governance update)`).

   最後にユーザーへ次の内容を含むサマリを出力します：
   - 新しいバージョンとバージョン更新の理由
   - 手動対応が必要と判断したファイル
   - 推奨コミットメッセージ（例：`docs: amend constitution to vX.Y.Z (principle additions + governance update)`）

Formatting & Style Requirements:
- Use Markdown headings exactly as in the template (do not demote/promote levels).
- Wrap long rationale lines to keep readability (<100 chars ideally) but do not hard enforce with awkward breaks.
- Keep a single blank line between sections.
- Avoid trailing whitespace.

フォーマットとスタイルの要件：
- 見出しレベルはテンプレート通りに使用し、上下の階層へ変更しない。
- 長い根拠の行は読みやすさのため可能であれば100文字未満を目安に折り返すが、不自然な分割は避ける。
- セクション間は1行の空行を維持する。
- 行末の余分な空白を残さない。

If the user supplies partial updates (e.g., only one principle revision), still perform validation and version decision steps.

ユーザーが部分的な更新（例：1つの原則のみの修正）を指示した場合でも、検証とバージョン決定のステップを必ず実行します。

If critical info missing (e.g., ratification date truly unknown), insert `TODO(<FIELD_NAME>): explanation` and include in the Sync Impact Report under deferred items.

重要情報が欠落している場合（例：採択日が不明）、`TODO(<FIELD_NAME>): 説明`を挿入し、同期影響レポートの保留項目に含めます。

Do not create a new template; always operate on the existing `/memory/constitution.md` file.

新しいテンプレートを作成せず、既存の`/memory/constitution.md`ファイル上で作業してください。
