---
description: Create or update the feature sp   **IMPORTANT**:

   **重要**：

   - Append the short-name argument to the `{SCRIPT}` command with the 2-4 word short name you created in step 1
     ステップ1で作成した2-4語の短縮名で`{SCRIPT}`コマンドに短縮名引数を追加
   - Bash: `--short-name "your-generated-short-name"`
   - PowerShell: `-ShortName "your-generated-short-name"`
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot")
     "I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）
   - You must only ever run this script once
     このスクリプトは一度だけ実行する必要があります
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for
     JSONは端末出力として提供されます - 探している実際のコンテンツを取得するため常にそれを参照してください

3. Load `templates/spec-template.md` to understand required sections.

   必要なセクションを理解するために`templates/spec-template.md`を読み込みます。

4. Follow this execution flow:

   この実行フローに従ってください： natural language feature description. / 自然言語機能説明から機能仕様を作成または更新
scripts:
  sh: scripts/bash/create-new-feature.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-feature.ps1 -Json "{ARGS}"
---

## User Input / ユーザー入力

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

進行前にユーザー入力を**必ず**考慮してください（空でない場合）。

## Outline / 概要

The text the user typed after `/speckit.specify` in the triggering message **is** the feature description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

トリガーメッセージで`/speckit.specify`の後にユーザーが入力したテキストが**機能説明**です。下記で`{ARGS}`が文字通り表示されていても、この会話で常に利用可能であると仮定してください。空のコマンドを提供された場合を除き、ユーザーに繰り返しを求めないでください。

Given that feature description, do this:

その機能説明を基に、以下を実行してください：

1. **Generate a concise short name** (2-4 words) for the branch:

   **ブランチの簡潔な短縮名を生成**（2-4語）：
   
   - Analyze the feature description and extract the most meaningful keywords / 機能説明を分析し、最も意味のあるキーワードを抽出
   - Create a 2-4 word short name that captures the essence of the feature / 機能の本質を捉える2-4語の短縮名を作成
   - Use action-noun format when possible (e.g., "add-user-auth", "fix-payment-bug") / 可能な場合は動作-名詞形式を使用（例："add-user-auth"、"fix-payment-bug"）
   - Preserve technical terms and acronyms (OAuth2, API, JWT, etc.) / 技術用語と略語を保持（OAuth2、API、JWTなど）
   - Keep it concise but descriptive enough to understand the feature at a glance / 簡潔だが、一目で機能を理解できる程度に説明的に保持
   - Examples / 例：
     - "I want to add user authentication" → "user-auth"
     - "Implement OAuth2 integration for the API" → "oauth2-api-integration"
     - "Create a dashboard for analytics" → "analytics-dashboard"
     - "Fix payment processing timeout bug" → "fix-payment-timeout"

2. Run the script `{SCRIPT}` from repo root **with the short-name argument** and parse its JSON output for BRANCH_NAME and SPEC_FILE. All file paths must be absolute.

   リポジトリルートから**短縮名引数付き**で`{SCRIPT}`スクリプトを実行し、BRANCH_NAMEとSPEC_FILEのJSON出力を解析します。すべてのファイルパスは絶対パスである必要があります。

   **IMPORTANT**:

   **重要**：

   - Append the short-name argument to the `{SCRIPT}` command with the 2-4 word short name you created in step 1
     ステップ1で作成した2-4語の短縮名で`{SCRIPT}`コマンドに短縮名引数を追加
   - Bash: `--short-name "your-generated-short-name"`
   - PowerShell: `-ShortName "your-generated-short-name"`
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot")
     "I'm Groot"のような引数内の単一引用符については、エスケープ構文を使用：例 'I'\''m Groot'（可能であれば二重引用符："I'm Groot"）
   - You must only ever run this script once
     このスクリプトは一度だけ実行する必要があります
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for
     JSONは端末出力として提供されます - 探している実際のコンテンツを取得するため常にそれを参照してください

3. Load `templates/spec-template.md` to understand required sections.

   必要なセクションを理解するために`templates/spec-template.md`を読み込みます。

4. Follow this execution flow:

   この実行フローに従ってください：

    1. Parse user description from Input
       If empty: ERROR "No feature description provided"
       
       入力からユーザー説明を解析
       空の場合：エラー「機能説明が提供されていません」
       
    2. Extract key concepts from description
       Identify: actors, actions, data, constraints
       
       説明から主要概念を抽出
       特定：アクター、アクション、データ、制約
       
    3. For unclear aspects:
       - Make informed guesses based on context and industry standards
       - Only mark with [NEEDS CLARIFICATION: specific question] if:
         - The choice significantly impacts feature scope or user experience
         - Multiple reasonable interpretations exist with different implications
         - No reasonable default exists
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by impact: scope > security/privacy > user experience > technical details
       
       不明確な側面について：
       - コンテキストと業界標準に基づく情報に基づいた推測を行う
       - 以下の場合のみ[NEEDS CLARIFICATION: 具体的質問]でマーク：
         - 選択が機能スコープやユーザーエクスペリエンスに大きく影響する
         - 異なる影響を持つ複数の合理的な解釈が存在する
         - 合理的なデフォルトが存在しない
       - **制限：最大3つの[NEEDS CLARIFICATION]マーカー**
       - 影響による明確化の優先順位：スコープ > セキュリティ/プライバシー > ユーザーエクスペリエンス > 技術詳細
       
    4. Fill User Scenarios & Testing section
       If no clear user flow: ERROR "Cannot determine user scenarios"
       
       ユーザーシナリオとテストセクションを記入
       明確なユーザーフローがない場合：エラー「ユーザーシナリオを決定できません」
       
    5. Generate Functional Requirements
       Each requirement must be testable
       Use reasonable defaults for unspecified details (document assumptions in Assumptions section)
       
       機能要件を生成
       各要件はテスト可能である必要がある
       未指定詳細には合理的なデフォルトを使用（仮定セクションで仮定を文書化）
       
    6. Define Success Criteria
       Create measurable, technology-agnostic outcomes
       Include both quantitative metrics (time, performance, volume) and qualitative measures (user satisfaction, task completion)
       Each criterion must be verifiable without implementation details
       
       成功基準を定義
       測定可能で技術に依存しない結果を作成
       定量的メトリクス（時間、パフォーマンス、ボリューム）と定性的測定（ユーザー満足度、タスク完了）の両方を含む
       各基準は実装詳細なしに検証可能である必要がある
       
    7. Identify Key Entities (if data involved)
       
       主要エンティティを特定（データが関与する場合）
       
    8. Return: SUCCESS (spec ready for planning)
    
       戻り値：SUCCESS（計画準備完了の仕様）

5. Write the specification to SPEC_FILE using the template structure, replacing placeholders with concrete details derived from the feature description (arguments) while preserving section order and headings.

   テンプレート構造を使用してSPEC_FILEに仕様を書き込みます。セクション順序と見出しを保持しながら、機能説明（引数）から導出された具体的詳細でプレースホルダーを置き換えます。

6. **Specification Quality Validation**: After writing the initial spec, validate it against quality criteria:

   **仕様品質検証**：初期仕様を書いた後、品質基準に対して検証します：
    
       戻り値：SUCCESS（計画準備完了の仕様）

5. Write the specification to SPEC_FILE using the template structure, replacing placeholders with concrete details derived from the feature description (arguments) while preserving section order and headings.

   テンプレート構造を使用してSPEC_FILEに仕様を書き込みます。セクション順序と見出しを保持しながら、機能説明（引数）から導出された具体的詳細でプレースホルダーを置き換えます。

6. **Specification Quality Validation**: After writing the initial spec, validate it against quality criteria:

   **仕様品質検証**：初期仕様を書いた後、品質基準に対して検証します：

   a. **Create Spec Quality Checklist**: Generate a checklist file at `FEATURE_DIR/checklists/requirements.md` using the checklist template structure with these validation items:
   
      **仕様品質チェックリストを作成**：以下の検証項目でチェックリストテンプレート構造を使用して`FEATURE_DIR/checklists/requirements.md`にチェックリストファイルを生成：
   
      ```markdown
      # Specification Quality Checklist: [FEATURE NAME] / 仕様品質チェックリスト: [機能名]
      
      **Purpose**: Validate specification completeness and quality before proceeding to planning
      **目的**：計画進行前に仕様の完全性と品質を検証
      **Created**: [DATE] / **作成日**：[日付]
      **Feature**: [Link to spec.md] / **機能**：[spec.mdへのリンク]
      
      ## Content Quality / コンテンツ品質
      
      - [ ] No implementation details (languages, frameworks, APIs) / 実装詳細なし（言語、フレームワーク、API）
      - [ ] Focused on user value and business needs / ユーザー価値とビジネスニーズに焦点
      - [ ] Written for non-technical stakeholders / 非技術系ステークホルダー向けに記述
      - [ ] All mandatory sections completed / すべての必須セクション完了
      
      ## Requirement Completeness / 要件完全性
      
      - [ ] No [NEEDS CLARIFICATION] markers remain / [NEEDS CLARIFICATION]マーカーが残っていない
      - [ ] Requirements are testable and unambiguous / 要件がテスト可能で曖昧でない
      - [ ] Success criteria are measurable / 成功基準が測定可能
      - [ ] Success criteria are technology-agnostic (no implementation details) / 成功基準が技術に依存しない（実装詳細なし）
      - [ ] All acceptance scenarios are defined / すべての受け入れシナリオが定義済み
      - [ ] Edge cases are identified / エッジケースが特定済み
      - [ ] Scope is clearly bounded / スコープが明確に境界設定済み
      - [ ] Dependencies and assumptions identified / 依存関係と仮定が特定済み
      
      ## Feature Readiness / 機能準備状況
      
      - [ ] All functional requirements have clear acceptance criteria / すべての機能要件に明確な受け入れ基準がある
      - [ ] User scenarios cover primary flows / ユーザーシナリオが主要フローをカバー
      - [ ] Feature meets measurable outcomes defined in Success Criteria / 機能が成功基準で定義された測定可能な結果を満たす
      - [ ] No implementation details leak into specification / 実装詳細が仕様に漏れていない
      
      ## Notes / 注記
      
      - Items marked incomplete require spec updates before `/speckit.clarify` or `/speckit.plan`
      - 不完全とマークされた項目は`/speckit.clarify`または`/speckit.plan`前に仕様更新が必要
      ```
   
   b. **Run Validation Check**: Review the spec against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant spec sections)
   
      **検証チェックを実行**：各チェックリスト項目に対して仕様をレビュー：
      - 各項目について、合格か不合格かを判定
      - 見つかった具体的問題を文書化（関連仕様セクションを引用）
   
   c. **Handle Validation Results**:
   
      **検証結果を処理**：
      
      - **If all items pass**: Mark checklist complete and proceed to step 6
      
        **すべての項目が合格の場合**：チェックリストを完了とマークしてステップ6に進む
      
      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the spec to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
      
        **項目が不合格の場合（[NEEDS CLARIFICATION]を除く）**：
        1. 不合格項目と具体的問題をリスト化
        2. 各問題に対処するため仕様を更新
        3. すべての項目が合格するまで検証を再実行（最大3回）
        4. 3回後も不合格の場合、残りの問題をチェックリスト注記に文書化してユーザーに警告
      
      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the spec
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by scope/security/UX impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:
        
        **[NEEDS CLARIFICATION]マーカーが残っている場合**：
        1. 仕様からすべての[NEEDS CLARIFICATION: ...]マーカーを抽出
        2. **制限チェック**：3つを超えるマーカーが存在する場合、最も重要な3つのみを保持（スコープ/セキュリティ/UX影響による）し、残りは情報に基づいた推測を行う
        3. 必要な各明確化（最大3つ）について、以下の形式でユーザーにオプションを提示：
        
           ```markdown
           ## Question [N]: [Topic] / 質問[N]：[トピック]
           
           **Context**: [Quote relevant spec section]
           **コンテキスト**：[関連仕様セクションを引用]
           
           **What we need to know**: [Specific question from NEEDS CLARIFICATION marker]
           **知る必要があること**：[NEEDS CLARIFICATIONマーカーからの具体的質問]
           
           **Suggested Answers** / **推奨回答**：
           
           | Option | Answer | Implications |
           | オプション | 回答 | 影響 |
           |--------|--------|--------------|
           | A      | [First suggested answer] | [What this means for the feature] |
           | A      | [最初の推奨回答] | [これが機能にとって何を意味するか] |
           | B      | [Second suggested answer] | [What this means for the feature] |
           | B      | [2番目の推奨回答] | [これが機能にとって何を意味するか] |
           | C      | [Third suggested answer] | [What this means for the feature] |
           | C      | [3番目の推奨回答] | [これが機能にとって何を意味するか] |
           | Custom | Provide your own answer | [Explain how to provide custom input] |
           | カスタム | 独自の回答を提供 | [カスタム入力の提供方法を説明] |
           
           **Your choice**: _[Wait for user response]_
           **あなたの選択**：_[ユーザー回答を待機]_
           ```
        
        4. **CRITICAL - Table Formatting**: Ensure markdown tables are properly formatted:
           - Use consistent spacing with pipes aligned
           - Each cell should have spaces around content: `| Content |` not `|Content|`
           - Header separator must have at least 3 dashes: `|--------|`
           - Test that the table renders correctly in markdown preview
           
           - 一貫したスペーシングでパイプを整列
           - 各セルでコンテンツの周りにスペース：`| Content |`、`|Content|`ではない
           - ヘッダー区切りは最低3つのダッシュが必要：`|--------|`
           - テーブルがmarkdownプレビューで正しくレンダリングされることをテスト
           
        5. Number questions sequentially (Q1, Q2, Q3 - max 3 total)
        6. Present all questions together before waiting for responses
        7. Wait for user to respond with their choices for all questions (e.g., "Q1: A, Q2: Custom - [details], Q3: B")
        8. Update the spec by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer
        9. Re-run validation after all clarifications are resolved
        
        5. 質問を順次番号付け（Q1、Q2、Q3 - 最大3つ）
        6. 回答を待つ前にすべての質問をまとめて提示
        7. ユーザーがすべての質問に対する選択で回答するのを待機（例："Q1: A, Q2: カスタム - [詳細], Q3: B"）
        8. 各[NEEDS CLARIFICATION]マーカーをユーザーが選択または提供した回答で置き換えて仕様を更新
        9. すべての明確化が解決された後に検証を再実行
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

      **チェックリストを更新**：各検証反復後、現在の合格/不合格ステータスでチェックリストファイルを更新

7. Report completion with branch name, spec file path, checklist results, and readiness for the next phase (`/speckit.clarify` or `/speckit.plan`).

   ブランチ名、仕様ファイルパス、チェックリスト結果、次フェーズ（`/speckit.clarify`または`/speckit.plan`）への準備状況で完了を報告します。

**NOTE:** The script creates and checks out the new branch and initializes the spec file before writing.

**注記：** スクリプトは書き込み前に新しいブランチを作成してチェックアウトし、仕様ファイルを初期化します。

## General Guidelines / 一般的ガイドライン

## Quick Guidelines / クイックガイドライン

- Focus on **WHAT** users need and **WHY**.
- フォーカス：ユーザーが**何を**必要とし、**なぜ**必要とするか。
- Avoid HOW to implement (no tech stack, APIs, code structure).
- 実装の**どのように**を避ける（技術スタック、API、コード構造なし）。
- Written for business stakeholders, not developers.
- 開発者ではなく、ビジネスステークホルダー向けに記述。
- DO NOT create any checklists that are embedded in the spec. That will be a separate command.
- 仕様に埋め込まれたチェックリストは作成しない。それは別のコマンドになります。

### Section Requirements / セクション要件

- **Mandatory sections**: Must be completed for every feature
- **必須セクション**：すべての機能で完了する必要がある
- **Optional sections**: Include only when relevant to the feature
- **オプションセクション**：機能に関連する場合のみ含める
- When a section doesn't apply, remove it entirely (don't leave as "N/A")
- セクションが適用されない場合は、完全に削除する（「N/A」として残さない）

### For AI Generation / AI生成用

When creating this spec from a user prompt:

ユーザープロンプトからこの仕様を作成する際：

1. **Make informed guesses**: Use context, industry standards, and common patterns to fill gaps
   **情報に基づいた推測を行う**：コンテキスト、業界標準、共通パターンを使用してギャップを埋める
2. **Document assumptions**: Record reasonable defaults in the Assumptions section
   **仮定を文書化**：仮定セクションで合理的なデフォルトを記録
3. **Limit clarifications**: Maximum 3 [NEEDS CLARIFICATION] markers - use only for critical decisions that:
   **明確化を制限**：最大3つの[NEEDS CLARIFICATION]マーカー - 以下の重要な決定にのみ使用：
   - Significantly impact feature scope or user experience
   - 機能スコープやユーザーエクスペリエンスに大きく影響
   - Have multiple reasonable interpretations with different implications
   - 異なる影響を持つ複数の合理的な解釈がある
   - Lack any reasonable default
   - 合理的なデフォルトが欠如している
4. **Prioritize clarifications**: scope > security/privacy > user experience > technical details
   **明確化の優先順位**：スコープ > セキュリティ/プライバシー > ユーザーエクスペリエンス > 技術詳細
5. **Think like a tester**: Every vague requirement should fail the "testable and unambiguous" checklist item
   **テスターのように考える**：曖昧な要件はすべて「テスト可能で曖昧でない」チェックリスト項目で不合格になるべき
6. **Common areas needing clarification** (only if no reasonable default exists):
   **明確化が必要な共通領域**（合理的なデフォルトが存在しない場合のみ）：
   - Feature scope and boundaries (include/exclude specific use cases)
   - 機能スコープと境界（特定ユースケースの含有/除外）
   - User types and permissions (if multiple conflicting interpretations possible)
   - ユーザータイプと権限（複数の矛盾する解釈が可能な場合）
   - Security/compliance requirements (when legally/financially significant)
   - セキュリティ/コンプライアンス要件（法的/財務的に重要な場合）
   
**Examples of reasonable defaults** (don't ask about these):

**合理的なデフォルトの例**（これらについては質問しない）：

- Data retention: Industry-standard practices for the domain
- データ保持：ドメインの業界標準プラクティス
- Performance targets: Standard web/mobile app expectations unless specified
- パフォーマンス目標：指定がない限り標準的なウェブ/モバイルアプリの期待値
- Error handling: User-friendly messages with appropriate fallbacks
- エラー処理：適切なフォールバック付きのユーザーフレンドリーメッセージ
- Authentication method: Standard session-based or OAuth2 for web apps
- 認証方法：ウェブアプリ用の標準セッションベースまたはOAuth2
- Integration patterns: RESTful APIs unless specified otherwise
- 統合パターン：特に指定がない限りRESTful API

### Success Criteria Guidelines / 成功基準ガイドライン

Success criteria must be:

成功基準は以下である必要があります：

1. **Measurable**: Include specific metrics (time, percentage, count, rate)
   **測定可能**：具体的メトリクス（時間、パーセンテージ、カウント、レート）を含む
2. **Technology-agnostic**: No mention of frameworks, languages, databases, or tools
   **技術に依存しない**：フレームワーク、言語、データベース、ツールの言及なし
3. **User-focused**: Describe outcomes from user/business perspective, not system internals
   **ユーザー中心**：システム内部ではなく、ユーザー/ビジネス観点からの結果を記述
4. **Verifiable**: Can be tested/validated without knowing implementation details
   **検証可能**：実装詳細を知らなくてもテスト/検証可能

**Good examples** / **良い例**：

- "Users can complete checkout in under 3 minutes"
- "ユーザーは3分以内にチェックアウトを完了できる"
- "System supports 10,000 concurrent users"
- "システムは10,000の同時ユーザーをサポート"
- "95% of searches return results in under 1 second"
- "検索の95%が1秒以内に結果を返す"
- "Task completion rate improves by 40%"
- "タスク完了率が40%向上"

**Bad examples** (implementation-focused) / **悪い例**（実装中心）：

- "API response time is under 200ms" (too technical, use "Users see results instantly")
- "APIレスポンス時間が200ms未満"（技術的すぎる、「ユーザーは即座に結果を見る」を使用）
- "Database can handle 1000 TPS" (implementation detail, use user-facing metric)
- "データベースが1000 TPSを処理可能"（実装詳細、ユーザー向けメトリクスを使用）
- "React components render efficiently" (framework-specific)
- "Reactコンポーネントが効率的にレンダリング"（フレームワーク固有）
- "Redis cache hit rate above 80%" (technology-specific)
- "Redisキャッシュヒット率80%以上"（技術固有）

