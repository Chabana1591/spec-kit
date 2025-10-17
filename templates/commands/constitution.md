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

4. Consistency propagation checklist (convert prior checklist into active validations):
   - Read `/templates/plan-template.md` and ensure any "Constitution Check" or rules align with updated principles.
   - Read `/templates/spec-template.md` for scope/requirements alignment—update if constitution adds/removes mandatory sections or constraints.
   - Read `/templates/tasks-template.md` and ensure task categorization reflects new or removed principle-driven task types (e.g., observability, versioning, testing discipline).
   - Read each command file in `/templates/commands/*.md` (including this one) to verify no outdated references (agent-specific names like CLAUDE only) remain when generic guidance is required.
   - Read any runtime guidance docs (e.g., `README.md`, `docs/quickstart.md`, or agent-specific guidance files if present). Update references to principles changed.

5. Produce a Sync Impact Report (prepend as an HTML comment at top of the constitution file after update):
   - Version change: old → new
   - List of modified principles (old title → new title if renamed)
   - Added sections
   - Removed sections
   - Templates requiring updates (✅ updated / ⚠ pending) with file paths
   - Follow-up TODOs if any placeholders intentionally deferred.

6. Validation before final output:
   - No remaining unexplained bracket tokens.
   - Version line matches report.
   - Dates ISO format YYYY-MM-DD.
   - Principles are declarative, testable, and free of vague language ("should" → replace with MUST/SHOULD rationale where appropriate).

7. Write the completed constitution back to `/memory/constitution.md` (overwrite).

8. Output a final summary to the user with:
   - New version and bump rationale.
   - Any files flagged for manual follow-up.
   - Suggested commit message (e.g., `docs: amend constitution to vX.Y.Z (principle additions + governance update)`).

Formatting & Style Requirements:
- Use Markdown headings exactly as in the template (do not demote/promote levels).
- Wrap long rationale lines to keep readability (<100 chars ideally) but do not hard enforce with awkward breaks.
- Keep a single blank line between sections.
- Avoid trailing whitespace.

If the user supplies partial updates (e.g., only one principle revision), still perform validation and version decision steps.

If critical info missing (e.g., ratification date truly unknown), insert `TODO(<FIELD_NAME>): explanation` and include in the Sync Impact Report under deferred items.

Do not create a new template; always operate on the existing `/memory/constitution.md` file.

