# Specification-Driven Development (SDD) / 仕様駆動開発（SDD）

## The Power Inversion / パワーの逆転

For decades, code has been king. Specifications served code—they were the scaffolding we built and then discarded once the "real work" of coding began. We wrote PRDs to guide development, created design docs to inform implementation, drew diagrams to visualize architecture. But these were always subordinate to the code itself. Code was truth. Everything else was, at best, good intentions. Code was the source of truth, and as it moved forward, specs rarely kept pace. As the asset (code) and the implementation are one, it's not easy to have a parallel implementation without trying to build from the code.

何十年もの間、コードが王様でした。仕様はコードに仕える存在で、「本当の作業」であるコーディングが始まると廃棄される足場のようなものでした。開発をガイドするためにPRDを書き、実装を説明するためにデザインドキュメントを作成し、アーキテクチャを視覚化するために図を描きました。しかし、これらは常にコード自体に従属するものでした。コードが真実でした。それ以外のものは、良くても善意にすぎませんでした。コードが真実の源であり、それが前進するにつれて、仕様が追いつくことはめったにありませんでした。資産（コード）と実装が一体である以上、コードから構築を試みることなく並行実装を行うことは容易ではありません。

Spec-Driven Development (SDD) inverts this power structure. Specifications don't serve code—code serves specifications. The Product Requirements Document (PRD) isn't a guide for implementation; it's the source that generates implementation. Technical plans aren't documents that inform coding; they're precise definitions that produce code. This isn't an incremental improvement to how we build software. It's a fundamental rethinking of what drives development.

仕様駆動開発（SDD）は、このパワー構造を逆転させます。仕様はコードに仕えるのではなく、コードが仕様に仕えます。プロダクト要件ドキュメント（PRD）は実装のガイドではなく、実装を生成する源です。技術計画はコーディングに情報を提供する文書ではなく、コードを生成する正確な定義です。これはソフトウェアの構築方法に対する段階的な改善ではありません。開発を駆動するもの自体の根本的な再考です。

The gap between specification and implementation has plagued software development since its inception. We've tried to bridge it with better documentation, more detailed requirements, stricter processes. These approaches fail because they accept the gap as inevitable. They try to narrow it but never eliminate it. SDD eliminates the gap by making specifications and their concrete implementation plans born from the specification executable. When specifications and implementation plans generate code, there is no gap—only transformation.

仕様と実装の間のギャップは、ソフトウェア開発の黎明期から悩みの種でした。私たちはより良いドキュメント、より詳細な要件、より厳格なプロセスでそれを埋めようとしてきました。これらのアプローチが失敗するのは、ギャップを不可避なものとして受け入れているからです。それらはギャップを狭めようとしますが、決して解消しません。SDDは、仕様とその仕様から生まれた具体的な実装計画を実行可能にすることで、ギャップを解消します。仕様と実装計画がコードを生成するとき、ギャップは存在せず、変換のみが存在します。

This transformation is now possible because AI can understand and implement complex specifications, and create detailed implementation plans. But raw AI generation without structure produces chaos. SDD provides that structure through specifications and subsequent implementation plans that are precise, complete, and unambiguous enough to generate working systems. The specification becomes the primary artifact. Code becomes its expression (as an implementation from the implementation plan) in a particular language and framework.

この変換が可能になったのは、AIが複雑な仕様を理解し実装でき、詳細な実装計画を作成できるようになったからです。しかし、構造のない生のAI生成は混沌を生み出します。SDDは、動作するシステムを生成するのに十分な正確性、完全性、明確性を持つ仕様と、それに続く実装計画を通じて、その構造を提供します。仕様が主要な成果物となります。コードは、特定の言語とフレームワークにおけるその表現（実装計画からの実装として）となります。

In this new world, maintaining software means evolving specifications. The intent of the development team is expressed in natural language ("**intent-driven development**"), design assets, core principles and other guidelines. The **lingua franca** of development moves to a higher level, and code is the last-mile approach.

この新しい世界では、ソフトウェアの保守は仕様の進化を意味します。開発チームの意図は自然言語（「**意図駆動開発**」）、デザイン資産、中核原則、その他のガイドラインで表現されます。開発の**共通語**はより高いレベルに移行し、コードはラストマイルアプローチとなります。

Debugging means fixing specifications and their implementation plans that generate incorrect code. Refactoring means restructuring for clarity. The entire development workflow reorganizes around specifications as the central source of truth, with implementation plans and code as the continuously regenerated output. Updating apps with new features or creating a new parallel implementation because we are creative beings, means revisiting the specification and creating new implementation plans. This process is therefore a 0 -> 1, (1', ..), 2, 3, N.

デバッグは、間違ったコードを生成する仕様とその実装計画を修正することを意味します。リファクタリングは、明確さのための再構築を意味します。開発ワークフロー全体が、仕様を中心的な真実の源として再編成され、実装計画とコードは継続的に再生成される出力となります。新機能でアプリを更新したり、創造的な存在である私たちが新しい並行実装を作成したりすることは、仕様を再検討し、新しい実装計画を作成することを意味します。したがって、このプロセスは0 -> 1、（1'、..）、2、3、Nとなります。

The development team focuses in on their creativity, experimentation, their critical thinking.

開発チームは、創造性、実験、批判的思考に集中します。

## The SDD Workflow in Practice / SDDワークフローの実践

The workflow begins with an idea—often vague and incomplete. Through iterative dialogue with AI, this idea becomes a comprehensive PRD. The AI asks clarifying questions, identifies edge cases, and helps define precise acceptance criteria. What might take days of meetings and documentation in traditional development happens in hours of focused specification work. This transforms the traditional SDLC—requirements and design become continuous activities rather than discrete phases. This is supportive of a **team process**, where team-reviewed specifications are expressed and versioned, created in branches, and merged.

ワークフローは、しばしば曖昧で不完全なアイデアから始まります。AIとの反復的な対話を通じて、このアイデアは包括的なPRDになります。AIは明確化の質問をし、エッジケースを特定し、正確な受け入れ基準の定義を支援します。従来の開発では数日間の会議と文書化が必要だったことが、数時間の集中的な仕様作業で完了します。これは従来のSDLCを変革します。要件と設計は離散的なフェーズではなく、継続的な活動となります。これは、チームが検討した仕様が表現され、バージョン管理され、ブランチで作成され、マージされる**チームプロセス**をサポートします。

When a product manager updates acceptance criteria, implementation plans automatically flag affected technical decisions. When an architect discovers a better pattern, the PRD updates to reflect new possibilities.

プロダクトマネージャーが受け入れ基準を更新すると、実装計画は影響を受ける技術的決定を自動的にフラグします。アーキテクトがより良いパターンを発見すると、PRDは新しい可能性を反映して更新されます。

Throughout this specification process, research agents gather critical context. They investigate library compatibility, performance benchmarks, and security implications. Organizational constraints are discovered and applied automatically—your company's database standards, authentication requirements, and deployment policies seamlessly integrate into every specification.

この仕様プロセス全体を通じて、研究エージェントが重要なコンテキストを収集します。ライブラリの互換性、パフォーマンスベンチマーク、セキュリティへの影響を調査します。組織的制約が発見され、自動的に適用されます。会社のデータベース標準、認証要件、デプロイメントポリシーが、すべての仕様にシームレスに統合されます。

From the PRD, AI generates implementation plans that map requirements to technical decisions. Every technology choice has documented rationale. Every architectural decision traces back to specific requirements. Throughout this process, consistency validation continuously improves quality. AI analyzes specifications for ambiguity, contradictions, and gaps—not as a one-time gate, but as an ongoing refinement.

PRDから、AIは要件を技術的決定にマップする実装計画を生成します。すべての技術選択には文書化された根拠があります。すべてのアーキテクチャ決定は、特定の要件にさかのぼります。このプロセス全体を通じて、一貫性検証が継続的に品質を向上させます。AIは、一回限りのゲートとしてではなく、継続的な改良として、仕様の曖昧さ、矛盾、ギャップを分析します。

Code generation begins as soon as specifications and their implementation plans are stable enough, but they do not have to be "complete." Early generations might be exploratory—testing whether the specification makes sense in practice. Domain concepts become data models. User stories become API endpoints. Acceptance scenarios become tests. This merges development and testing through specification—test scenarios aren't written after code, they're part of the specification that generates both implementation and tests.

コード生成は、仕様とその実装計画が十分に安定した段階で開始されますが、「完全」である必要はありません。初期の生成は探索的かもしれません。仕様が実際に意味があるかどうかをテストします。ドメインコンセプトはデータモデルになります。ユーザーストーリーはAPIエンドポイントになります。受け入れシナリオはテストになります。これは仕様を通じて開発とテストを統合します。テストシナリオはコードの後に書かれるのではなく、実装とテストの両方を生成する仕様の一部です。

The feedback loop extends beyond initial development. Production metrics and incidents don't just trigger hotfixes—they update specifications for the next regeneration. Performance bottlenecks become new non-functional requirements. Security vulnerabilities become constraints that affect all future generations. This iterative dance between specification, implementation, and operational reality is where true understanding emerges and where the traditional SDLC transforms into a continuous evolution.

フィードバックループは初期開発を超えて拡張されます。本番メトリクスとインシデントは、単にホットフィックスを引き起こすだけでなく、次の再生成のために仕様を更新します。パフォーマンスのボトルネックは、新しい非機能要件となります。セキュリティの脆弱性は、すべての将来の世代に影響する制約となります。仕様、実装、運用現実の間のこの反復的なダンスこそが、真の理解が生まれ、従来のSDLCが継続的な進化に変革される場所です。

## Why SDD Matters Now / なぜ今SDDが重要なのか

Three trends make SDD not just possible but necessary:

3つのトレンドがSDDを可能にするだけでなく、必要不可欠にしています：

First, AI capabilities have reached a threshold where natural language specifications can reliably generate working code. This isn't about replacing developers—it's about amplifying their effectiveness by automating the mechanical translation from specification to implementation. It can amplify exploration and creativity, support "start-over" easily, and support addition, subtraction, and critical thinking.

第一に、AIの能力は、自然言語仕様が動作するコードを確実に生成できる閾値に達しました。これは開発者を置き換えることではなく、仕様から実装への機械的翻訳を自動化することで、彼らの効果を増幅することです。探索と創造性を増幅し、「やり直し」を簡単にサポートし、追加、削除、批判的思考をサポートできます。

Second, software complexity continues to grow exponentially. Modern systems integrate dozens of services, frameworks, and dependencies. Keeping all these pieces aligned with original intent through manual processes becomes increasingly difficult. SDD provides systematic alignment through specification-driven generation. Frameworks may evolve to provide AI-first support, not human-first support, or architect around reusable components.

第二に、ソフトウェアの複雑さは指数関数的に成長し続けています。現代のシステムは、数十のサービス、フレームワーク、依存関係を統合します。手動プロセスを通じてこれらすべての部品を元の意図と整合させることは、ますます困難になっています。SDDは、仕様駆動生成を通じて体系的な整合性を提供します。フレームワークは、人間ファーストサポートではなく、AIファーストサポートを提供するか、再利用可能なコンポーネント周りでアーキテクチャを構築するように進化するかもしれません。

Third, the pace of change accelerates. Requirements change far more rapidly today than ever before. Pivoting is no longer exceptional—it's expected. Modern product development demands rapid iteration based on user feedback, market conditions, and competitive pressures. Traditional development treats these changes as disruptions. Each pivot requires manually propagating changes through documentation, design, and code. The result is either slow, careful updates that limit velocity, or fast, reckless changes that accumulate technical debt.

第三に、変化のペースが加速しています。今日、要件はかつてないほど急速に変化します。ピボットは例外的なことではなくなり、期待されることです。現代のプロダクト開発は、ユーザーフィードバック、市場状況、競争圧力に基づく迅速な反復を求めています。従来の開発は、これらの変化を混乱として扱います。各ピボットには、文書、設計、コードを通じて変更を手動で伝播する必要があります。結果は、速度を制限する遅くて慎重な更新か、技術的負債を蓄積する速くて無謀な変更のどちらかです。

SDD can support what-if/simulation experiments: "If we need to re-implement or change the application to promote a business need to sell more T-shirts, how would we implement and experiment for that?"

SDDは、what-if/シミュレーション実験をサポートできます：「Tシャツをもっと売るというビジネスニーズを促進するためにアプリケーションを再実装または変更する必要がある場合、それをどのように実装し実験するか？」

SDD transforms requirement changes from obstacles into normal workflow. When specifications drive implementation, pivots become systematic regenerations rather than manual rewrites. Change a core requirement in the PRD, and affected implementation plans update automatically. Modify a user story, and corresponding API endpoints regenerate. This isn't just about initial development—it's about maintaining engineering velocity through inevitable changes.

SDDは、要件変更を障害から通常のワークフローに変換します。仕様が実装を駆動するとき、ピボットは手動の書き直しではなく、体系的な再生成になります。PRDの中核要件を変更すると、影響を受ける実装計画が自動的に更新されます。ユーザーストーリーを変更すると、対応するAPIエンドポイントが再生成されます。これは初期開発だけでなく、避けられない変更を通じてエンジニアリング速度を維持することです。

## Core Principles / 中核原則

**Specifications as the Lingua Franca**: The specification becomes the primary artifact. Code becomes its expression in a particular language and framework. Maintaining software means evolving specifications.

**共通語としての仕様**：仕様が主要な成果物となります。コードは、特定の言語とフレームワークにおけるその表現となります。ソフトウェアの保守は仕様の進化を意味します。

**Executable Specifications**: Specifications must be precise, complete, and unambiguous enough to generate working systems. This eliminates the gap between intent and implementation.

**実行可能な仕様**：仕様は、動作するシステムを生成するのに十分な正確性、完全性、明確性を持たなければなりません。これは意図と実装の間のギャップを解消します。

**Continuous Refinement**: Consistency validation happens continuously, not as a one-time gate. AI analyzes specifications for ambiguity, contradictions, and gaps as an ongoing process.

**継続的改良**：一貫性検証は、一回限りのゲートではなく、継続的に行われます。AIは、継続的なプロセスとして、仕様の曖昧さ、矛盾、ギャップを分析します。

**Research-Driven Context**: Research agents gather critical context throughout the specification process, investigating technical options, performance implications, and organizational constraints.

**研究駆動コンテキスト**：研究エージェントは、仕様プロセス全体を通じて重要なコンテキストを収集し、技術的選択肢、パフォーマンスへの影響、組織的制約を調査します。

**Bidirectional Feedback**: Production reality informs specification evolution. Metrics, incidents, and operational learnings become inputs for specification refinement.

**双方向フィードバック**：本番現実が仕様の進化に情報を提供します。メトリクス、インシデント、運用学習が仕様改良の入力となります。

**Branching for Exploration**: Generate multiple implementation approaches from the same specification to explore different optimization targets—performance, maintainability, user experience, cost.

**探索のためのブランチ化**：同じ仕様から複数の実装アプローチを生成し、異なる最適化ターゲット（パフォーマンス、保守性、ユーザーエクスペリエンス、コスト）を探索します。

## Implementation Approaches / 実装アプローチ

Today, practicing SDD requires assembling existing tools and maintaining discipline throughout the process. The methodology can be practiced with:

今日、SDDを実践するには、既存のツールを組み合わせ、プロセス全体を通じて規律を維持する必要があります。この方法論は以下で実践できます：

- AI assistants for iterative specification development
- Research agents for gathering technical context
- Code generation tools for translating specifications to implementation
- Version control systems adapted for specification-first workflows
- Consistency checking through AI analysis of specification documents

- 反復的仕様開発のためのAIアシスタント
- 技術的コンテキスト収集のための研究エージェント
- 仕様を実装に翻訳するためのコード生成ツール
- 仕様ファーストワークフローに適応したバージョン管理システム
- 仕様文書のAI分析による一貫性チェック

The key is treating specifications as the source of truth, with code as the generated output that serves the specification rather than the other way around.

鍵は、仕様を真実の源として扱い、コードを仕様に仕える生成された出力として扱うことです。その逆ではありません。

## Streamlining SDD with Commands / コマンドによるSDDの合理化

The SDD methodology is significantly enhanced through three powerful commands that automate the specification → planning → tasking workflow:

SDD方法論は、仕様 → 計画 → タスク化ワークフローを自動化する3つの強力なコマンドにより大幅に強化されます：

### The `/speckit.specify` Command / `/speckit.specify`コマンド

This command transforms a simple feature description (the user-prompt) into a complete, structured specification with automatic repository management:

このコマンドは、シンプルな機能説明（ユーザープロンプト）を、自動リポジトリ管理を伴う完全で構造化された仕様に変換します：

1. **Automatic Feature Numbering**: Scans existing specs to determine the next feature number (e.g., 001, 002, 003)
2. **Branch Creation**: Generates a semantic branch name from your description and creates it automatically
3. **Template-Based Generation**: Copies and customizes the feature specification template with your requirements
4. **Directory Structure**: Creates the proper `specs/[branch-name]/` structure for all related documents

1. **自動機能番号付け**：既存の仕様をスキャンして次の機能番号を決定（例：001、002、003）
2. **ブランチ作成**：説明からセマンティックブランチ名を生成し、自動的に作成
3. **テンプレートベース生成**：機能仕様テンプレートをコピーし、要件でカスタマイズ
4. **ディレクトリ構造**：関連するすべての文書用の適切な`specs/[branch-name]/`構造を作成

### The `/speckit.plan` Command / `/speckit.plan`コマンド

Once a feature specification exists, this command creates a comprehensive implementation plan:

機能仕様が存在すると、このコマンドは包括的な実装計画を作成します：

1. **Specification Analysis**: Reads and understands the feature requirements, user stories, and acceptance criteria
2. **Constitutional Compliance**: Ensures alignment with project constitution and architectural principles
3. **Technical Translation**: Converts business requirements into technical architecture and implementation details
4. **Detailed Documentation**: Generates supporting documents for data models, API contracts, and test scenarios
5. **Quickstart Validation**: Produces a quickstart guide capturing key validation scenarios

1. **仕様分析**：機能要件、ユーザーストーリー、受け入れ基準を読み取り理解
2. **憲法遵守**：プロジェクト憲法とアーキテクチャ原則との整合性を確保
3. **技術翻訳**：ビジネス要件を技術アーキテクチャと実装詳細に変換
4. **詳細文書化**：データモデル、API契約、テストシナリオのサポート文書を生成
5. **クイックスタート検証**：主要な検証シナリオを捉えたクイックスタートガイドを作成

### The `/speckit.tasks` Command / `/speckit.tasks`コマンド

After a plan is created, this command analyzes the plan and related design documents to generate an executable task list:

計画が作成された後、このコマンドは計画と関連する設計文書を分析して、実行可能なタスクリストを生成します：

1. **Inputs**: Reads `plan.md` (required) and, if present, `data-model.md`, `contracts/`, and `research.md`
2. **Task Derivation**: Converts contracts, entities, and scenarios into specific tasks
3. **Parallelization**: Marks independent tasks `[P]` and outlines safe parallel groups
4. **Output**: Writes `tasks.md` in the feature directory, ready for execution by a Task agent

1. **入力**：`plan.md`（必須）と、存在する場合は`data-model.md`、`contracts/`、`research.md`を読み取り
2. **タスク導出**：契約、エンティティ、シナリオを具体的なタスクに変換
3. **並列化**：独立したタスクを`[P]`でマークし、安全な並列グループを概説
4. **出力**：機能ディレクトリに`tasks.md`を書き込み、タスクエージェントによる実行準備完了

### Example: Building a Chat Feature / 例：チャット機能の構築

Here's how these commands transform the traditional development workflow:

これらのコマンドが従来の開発ワークフローをどのように変革するかを示します：

**Traditional Approach / 従来のアプローチ:**

```text
1. Write a PRD in a document (2-3 hours)
2. Create design documents (2-3 hours)
3. Set up project structure manually (30 minutes)
4. Write technical specifications (3-4 hours)
5. Create test plans (2 hours)
Total: ~12 hours of documentation work

1. 文書でPRDを書く（2-3時間）
2. 設計文書を作成（2-3時間）
3. プロジェクト構造を手動設定（30分）
4. 技術仕様を書く（3-4時間）
5. テスト計画を作成（2時間）
合計：約12時間の文書作業
```

**SDD with Commands Approach / コマンドを使ったSDDアプローチ:**

```bash
# Step 1: Create the feature specification (5 minutes)
# ステップ1：機能仕様を作成（5分）
/speckit.specify Real-time chat system with message history and user presence

# This automatically:
# 以下が自動的に実行されます：
# - Creates branch "003-chat-system"
# - Generates specs/003-chat-system/spec.md
# - Populates it with structured requirements
# - ブランチ "003-chat-system" を作成
# - specs/003-chat-system/spec.md を生成
# - 構造化された要件で記入

# Step 2: Generate implementation plan (5 minutes)
# ステップ2：実装計画を生成（5分）
/speckit.plan WebSocket for real-time messaging, PostgreSQL for history, Redis for presence

# Step 3: Generate executable tasks (5 minutes)
# ステップ3：実行可能なタスクを生成（5分）
/speckit.tasks

# This automatically creates:
# 以下が自動的に作成されます：
# - specs/003-chat-system/plan.md
# - specs/003-chat-system/research.md (WebSocket library comparisons)
# - specs/003-chat-system/data-model.md (Message and User schemas)
# - specs/003-chat-system/contracts/ (WebSocket events, REST endpoints)
# - specs/003-chat-system/quickstart.md (Key validation scenarios)
# - specs/003-chat-system/tasks.md (Task list derived from the plan)
# - specs/003-chat-system/research.md（WebSocketライブラリ比較）
# - specs/003-chat-system/data-model.md（MessageとUserスキーマ）
# - specs/003-chat-system/contracts/（WebSocketイベント、RESTエンドポイント）
# - specs/003-chat-system/quickstart.md（主要な検証シナリオ）
# - specs/003-chat-system/tasks.md（計画から導出されたタスクリスト）
```

In 15 minutes, you have:

15分で、以下が完成します：

- A complete feature specification with user stories and acceptance criteria
- A detailed implementation plan with technology choices and rationale
- API contracts and data models ready for code generation
- Comprehensive test scenarios for both automated and manual testing
- All documents properly versioned in a feature branch

- ユーザーストーリーと受け入れ基準を含む完全な機能仕様
- 技術選択と根拠を含む詳細な実装計画
- コード生成準備済みのAPI契約とデータモデル
- 自動および手動テスト用の包括的なテストシナリオ
- 機能ブランチで適切にバージョン管理されたすべての文書

### The Power of Structured Automation / 構造化自動化の力

These commands don't just save time—they enforce consistency and completeness:

これらのコマンドは時間を節約するだけでなく、一貫性と完全性を強制します：

1. **No Forgotten Details**: Templates ensure every aspect is considered, from non-functional requirements to error handling
2. **Traceable Decisions**: Every technical choice links back to specific requirements
3. **Living Documentation**: Specifications stay in sync with code because they generate it
4. **Rapid Iteration**: Change requirements and regenerate plans in minutes, not days

1. **忘れられた詳細なし**：テンプレートは、非機能要件からエラーハンドリングまで、あらゆる側面が考慮されることを確保
2. **追跡可能な決定**：すべての技術選択は特定の要件にリンク
3. **生きた文書**：仕様がコードを生成するため、コードと同期を保持
4. **迅速な反復**：要件を変更し、日ではなく分で計画を再生成

The commands embody SDD principles by treating specifications as executable artifacts rather than static documents. They transform the specification process from a necessary evil into the driving force of development.

コマンドは、仕様を静的な文書ではなく実行可能な成果物として扱うことで、SDD原則を体現します。仕様プロセスを必要悪から開発の推進力に変換します。

### Template-Driven Quality: How Structure Constrains LLMs for Better Outcomes / テンプレート駆動品質：構造がLLMをより良い結果のために制約する方法

The true power of these commands lies not just in automation, but in how the templates guide LLM behavior toward higher-quality specifications. The templates act as sophisticated prompts that constrain the LLM's output in productive ways:

これらのコマンドの真の力は、自動化だけでなく、テンプレートがLLMの動作をより高品質な仕様に導く方法にあります。テンプレートは、LLMの出力を生産的な方法で制約する洗練されたプロンプトとして機能します：

#### 1. **Preventing Premature Implementation Details / 早すぎる実装詳細の防止**

The feature specification template explicitly instructs:

機能仕様テンプレートは明示的に指示します：

```text
- ✅ Focus on WHAT users need and WHY
- ❌ Avoid HOW to implement (no tech stack, APIs, code structure)

- ✅ ユーザーが何を必要とし、なぜ必要なのかに焦点を当てる
- ❌ 実装方法を避ける（技術スタック、API、コード構造なし）
```

This constraint forces the LLM to maintain proper abstraction levels. When an LLM might naturally jump to "implement using React with Redux," the template keeps it focused on "users need real-time updates of their data." This separation ensures specifications remain stable even as implementation technologies change.

この制約により、LLMは適切な抽象化レベルを維持するよう強制されます。LLMが自然に「ReactとReduxを使って実装する」にジャンプしたがるとき、テンプレートは「ユーザーはデータのリアルタイム更新を必要とする」に焦点を保ちます。この分離により、実装技術が変わっても仕様が安定することが保証されます。

#### 2. **Forcing Explicit Uncertainty Markers / 明示的不確実性マーカーの強制**

Both templates mandate the use of `[NEEDS CLARIFICATION]` markers:

両方のテンプレートは`[要明確化]`マーカーの使用を義務付けます：

```text
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question]
2. **Don't guess**: If the prompt doesn't specify something, mark it

ユーザープロンプトからこの仕様を作成する際：
1. **すべての曖昧さをマーク**：[要明確化：具体的な質問]を使用
2. **推測しない**：プロンプトが何かを指定していない場合、マークする
```

This prevents the common LLM behavior of making plausible but potentially incorrect assumptions. Instead of guessing that a "login system" uses email/password authentication, the LLM must mark it as `[NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?]`.

これは、もっともらしいが潜在的に間違った仮定を立てるという一般的なLLMの動作を防ぎます。「ログインシステム」がメール/パスワード認証を使用すると推測する代わりに、LLMは`[要明確化：認証方法が指定されていません - メール/パスワード、SSO、OAuth？]`としてマークしなければなりません。

#### 3. **Structured Thinking Through Checklists / チェックリストによる構造化思考**

The templates include comprehensive checklists that act as "unit tests" for the specification:

テンプレートには、仕様の「単体テスト」として機能する包括的なチェックリストが含まれています：

```markdown
### Requirement Completeness / 要件完全性
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and unambiguous
- [ ] Success criteria are measurable

- [ ] [要明確化]マーカーが残っていない
- [ ] 要件がテスト可能で明確である
- [ ] 成功基準が測定可能である
```

These checklists force the LLM to self-review its output systematically, catching gaps that might otherwise slip through. It's like giving the LLM a quality assurance framework.

これらのチェックリストは、LLMが出力を体系的に自己レビューすることを強制し、そうでなければ見逃されるかもしれないギャップを捉えます。LLMに品質保証フレームワークを与えるようなものです。

#### 4. **Constitutional Compliance Through Gates / ゲートによる憲法遵守**

The implementation plan template enforces architectural principles through phase gates:

実装計画テンプレートは、フェーズゲートを通じてアーキテクチャ原則を強制します：

```markdown
### Phase -1: Pre-Implementation Gates / フェーズ-1：実装前ゲート
#### Simplicity Gate (Article VII) / シンプリシティゲート（第VII条）
- [ ] Using ≤3 projects? / ≤3プロジェクトを使用？
- [ ] No future-proofing? / 将来対応なし？
#### Anti-Abstraction Gate (Article VIII) / 抽象化防止ゲート（第VIII条）
- [ ] Using framework directly? / フレームワークを直接使用？
- [ ] Single model representation? / 単一モデル表現？
```

These gates prevent over-engineering by making the LLM explicitly justify any complexity. If a gate fails, the LLM must document why in the "Complexity Tracking" section, creating accountability for architectural decisions.

これらのゲートは、LLMに複雑さを明示的に正当化させることで、過剰エンジニアリングを防ぎます。ゲートが失敗した場合、LLMは「複雑性追跡」セクションでその理由を文書化する必要があり、アーキテクチャ決定に対する説明責任を作成します。

#### 5. **Hierarchical Detail Management / 階層的詳細管理**

The templates enforce proper information architecture:

テンプレートは適切な情報アーキテクチャを強制します：

```text
**IMPORTANT**: This implementation plan should remain high-level and readable.
Any code samples, detailed algorithms, or extensive technical specifications
must be placed in the appropriate `implementation-details/` file

**重要**：この実装計画は高レベルで読みやすく保つべきです。
コードサンプル、詳細なアルゴリズム、広範囲な技術仕様は
適切な`implementation-details/`ファイルに配置する必要があります
```

This prevents the common problem of specifications becoming unreadable code dumps. The LLM learns to maintain appropriate detail levels, extracting complexity to separate files while keeping the main document navigable.

これは、仕様が読めないコードダンプになるという一般的な問題を防ぎます。LLMは適切な詳細レベルを維持することを学び、メイン文書をナビゲート可能に保ちながら、複雑さを別のファイルに抽出します。

#### 6. **Test-First Thinking / テストファースト思考**

The implementation template enforces test-first development:

実装テンプレートはテストファースト開発を強制します：

```text
### File Creation Order / ファイル作成順序
1. Create `contracts/` with API specifications
2. Create test files in order: contract → integration → e2e → unit
3. Create source files to make tests pass

1. API仕様で`contracts/`を作成
2. テストファイルを順序で作成：契約 → 統合 → e2e → 単体
3. テストを通すためのソースファイルを作成
```

This ordering constraint ensures the LLM thinks about testability and contracts before implementation, leading to more robust and verifiable specifications.

この順序制約により、LLMは実装前にテスト可能性と契約について考えることが保証され、より堅牢で検証可能な仕様につながります。

#### 7. **Preventing Speculative Features / 投機的機能の防止**

Templates explicitly discourage speculation:

テンプレートは明示的に投機を阻止します：

```text
- [ ] No speculative or "might need" features
- [ ] All phases have clear prerequisites and deliverables

- [ ] 投機的または「必要かもしれない」機能なし
- [ ] すべてのフェーズに明確な前提条件と成果物がある
```

This stops the LLM from adding "nice to have" features that complicate implementation. Every feature must trace back to a concrete user story with clear acceptance criteria.

これは、実装を複雑にする「あると良い」機能をLLMが追加することを止めます。すべての機能は、明確な受け入れ基準を持つ具体的なユーザーストーリーにさかのぼる必要があります。

### The Compound Effect / 複合効果

These constraints work together to produce specifications that are:

これらの制約は連携して、以下のような仕様を生成します：

- **Complete**: Checklists ensure nothing is forgotten
- **Unambiguous**: Forced clarification markers highlight uncertainties
- **Testable**: Test-first thinking baked into the process
- **Maintainable**: Proper abstraction levels and information hierarchy
- **Implementable**: Clear phases with concrete deliverables

- **完全**：チェックリストにより何も忘れられない
- **明確**：強制的な明確化マーカーが不確実性を強調
- **テスト可能**：プロセスに組み込まれたテストファースト思考
- **保守可能**：適切な抽象化レベルと情報階層
- **実装可能**：具体的な成果物を持つ明確なフェーズ

The templates transform the LLM from a creative writer into a disciplined specification engineer, channeling its capabilities toward producing consistently high-quality, executable specifications that truly drive development.

テンプレートは、LLMを創作者から規律ある仕様エンジニアに変換し、その能力を一貫して高品質で実行可能な、真に開発を駆動する仕様の生成に向けて導きます。

## The Constitutional Foundation: Enforcing Architectural Discipline / 憲法基盤：アーキテクチャ規律の強制

At the heart of SDD lies a constitution—a set of immutable principles that govern how specifications become code. The constitution (`memory/constitution.md`) acts as the architectural DNA of the system, ensuring that every generated implementation maintains consistency, simplicity, and quality.

SDDの中心には憲法があります。仕様がコードになる方法を統治する不変の原則のセットです。憲法（`memory/constitution.md`）は、システムのアーキテクチャDNAとして機能し、生成されるすべての実装が一貫性、シンプリシティ、品質を維持することを保証します。

### The Nine Articles of Development / 開発の9条項

The constitution defines nine articles that shape every aspect of the development process:

憲法は、開発プロセスのあらゆる側面を形作る9つの条項を定義します：

#### Article I: Library-First Principle / 第I条：ライブラリファースト原則

Every feature must begin as a standalone library—no exceptions. This forces modular design from the start:

すべての機能は独立したライブラリとして開始されなければならず、例外はありません。これにより最初からモジュラー設計が強制されます：

```text
Every feature in Specify MUST begin its existence as a standalone library.
No feature shall be implemented directly within application code without
first being abstracted into a reusable library component.

Specifyのすべての機能は、独立したライブラリとしてその存在を開始しなければならない。
再利用可能なライブラリコンポーネントに最初に抽象化されることなく、
アプリケーションコード内で直接実装されてはならない。
```

This principle ensures that specifications generate modular, reusable code rather than monolithic applications. When the LLM generates an implementation plan, it must structure features as libraries with clear boundaries and minimal dependencies.

この原則により、仕様がモノリシックアプリケーションではなく、モジュラーで再利用可能なコードを生成することが保証されます。LLMが実装計画を生成する際、明確な境界と最小限の依存関係を持つライブラリとして機能を構造化する必要があります。

#### Article II: CLI Interface Mandate / 第II条：CLIインターフェース義務

Every library must expose its functionality through a command-line interface:

すべてのライブラリは、コマンドラインインターフェースを通じてその機能を公開しなければなりません：

```text
All CLI interfaces MUST:
- Accept text as input (via stdin, arguments, or files)
- Produce text as output (via stdout)
- Support JSON format for structured data exchange

すべてのCLIインターフェースは以下を満たさなければならない：
- テキストを入力として受け入れる（stdin、引数、またはファイル経由）
- テキストを出力として生成する（stdout経由）
- 構造化データ交換用のJSON形式をサポートする
```

This enforces observability and testability. The LLM cannot hide functionality inside opaque classes—everything must be accessible and verifiable through text-based interfaces.

これは観測可能性とテスト可能性を強制します。LLMは不透明なクラス内に機能を隠すことはできません。すべてがテキストベースのインターフェースを通じてアクセス可能で検証可能でなければなりません。

#### Article III: Test-First Imperative / 第III条：テストファースト義務

The most transformative article—no code before tests:

最も変革的な条項—テスト前にコードなし：

```text
This is NON-NEGOTIABLE: All implementation MUST follow strict Test-Driven Development.
No implementation code shall be written before:
1. Unit tests are written
2. Tests are validated and approved by the user
3. Tests are confirmed to FAIL (Red phase)

これは交渉の余地なし：すべての実装は厳格なテスト駆動開発に従わなければならない。
以下の前に実装コードを書いてはならない：
1. 単体テストが書かれる
2. テストがユーザーによって検証され承認される
3. テストが失敗することが確認される（レッドフェーズ）
```

This completely inverts traditional AI code generation. Instead of generating code and hoping it works, the LLM must first generate comprehensive tests that define behavior, get them approved, and only then generate implementation.

これは従来のAIコード生成を完全に逆転させます。コードを生成してうまくいくことを期待する代わりに、LLMは最初に動作を定義する包括的なテストを生成し、それを承認してもらい、その後でのみ実装を生成する必要があります。

#### Articles VII & VIII: Simplicity and Anti-Abstraction / 第VII & VIII条：シンプリシティと抽象化防止

These paired articles combat over-engineering:

これらの対となる条項は過剰エンジニアリングと戦います：

```text
Section 7.3: Minimal Project Structure
- Maximum 3 projects for initial implementation
- Additional projects require documented justification

Section 8.1: Framework Trust
- Use framework features directly rather than wrapping them

セクション7.3：最小限のプロジェクト構造
- 初期実装には最大3プロジェクト
- 追加プロジェクトには文書化された正当化が必要

セクション8.1：フレームワーク信頼
- フレームワーク機能をラップするのではなく直接使用
```

When an LLM might naturally create elaborate abstractions, these articles force it to justify every layer of complexity. The implementation plan template's "Phase -1 Gates" directly enforce these principles.

LLMが自然に精巧な抽象化を作成したがるとき、これらの条項は複雑さのすべての層を正当化することを強制します。実装計画テンプレートの「フェーズ-1ゲート」は、これらの原則を直接強制します。

#### Article IX: Integration-First Testing / 第IX条：統合ファーストテスト

Prioritizes real-world testing over isolated unit tests:

分離された単体テストよりも実世界テストを優先します：

```text
Tests MUST use realistic environments:
- Prefer real databases over mocks
- Use actual service instances over stubs
- Contract tests mandatory before implementation

テストは現実的な環境を使用しなければならない：
- モックよりも実際のデータベースを優先
- スタブよりも実際のサービスインスタンスを使用
- 実装前に契約テストを義務化
```

This ensures generated code works in practice, not just in theory.

これにより、生成されたコードが理論上だけでなく実際に動作することが保証されます。

### Constitutional Enforcement Through Templates / テンプレートによる憲法強制

The implementation plan template operationalizes these articles through concrete checkpoints:

実装計画テンプレートは、具体的なチェックポイントを通じてこれらの条項を運用化します：

```markdown
### Phase -1: Pre-Implementation Gates / フェーズ-1：実装前ゲート
#### Simplicity Gate (Article VII) / シンプリシティゲート（第VII条）
- [ ] Using ≤3 projects? / ≤3プロジェクトを使用？
- [ ] No future-proofing? / 将来対応なし？

#### Anti-Abstraction Gate (Article VIII) / 抽象化防止ゲート（第VIII条）
- [ ] Using framework directly? / フレームワークを直接使用？
- [ ] Single model representation? / 単一モデル表現？

#### Integration-First Gate (Article IX) / 統合ファーストゲート（第IX条）
- [ ] Contracts defined? / 契約が定義されている？
- [ ] Contract tests written? / 契約テストが書かれている？
```

These gates act as compile-time checks for architectural principles. The LLM cannot proceed without either passing the gates or documenting justified exceptions in the "Complexity Tracking" section.

これらのゲートは、アーキテクチャ原則のコンパイル時チェックとして機能します。LLMは、ゲートを通過するか、「複雑性追跡」セクションで正当化された例外を文書化することなしには進むことができません。

### The Power of Immutable Principles / 不変原則の力

The constitution's power lies in its immutability. While implementation details can evolve, the core principles remain constant. This provides:

憲法の力は、その不変性にあります。実装詳細は進化できますが、中核原則は一定のままです。これにより提供されるのは：

1. **Consistency Across Time**: Code generated today follows the same principles as code generated next year
2. **Consistency Across LLMs**: Different AI models produce architecturally compatible code
3. **Architectural Integrity**: Every feature reinforces rather than undermines the system design
4. **Quality Guarantees**: Test-first, library-first, and simplicity principles ensure maintainable code

1. **時間を通じた一貫性**：今日生成されるコードは来年生成されるコードと同じ原則に従う
2. **LLM間の一貫性**：異なるAIモデルがアーキテクチャ的に互換性のあるコードを生成
3. **アーキテクチャ整合性**：すべての機能がシステム設計を損なうのではなく強化する
4. **品質保証**：テストファースト、ライブラリファースト、シンプリシティ原則が保守可能なコードを保証

### Constitutional Evolution / 憲法進化

While principles are immutable, their application can evolve:

原則は不変ですが、その適用は進化できます：

```text
Section 4.2: Amendment Process
Modifications to this constitution require:
- Explicit documentation of the rationale for change
- Review and approval by project maintainers
- Backwards compatibility assessment

セクション4.2：修正プロセス
この憲法の修正には以下が必要：
- 変更の根拠の明示的文書化
- プロジェクトメンテナーによるレビューと承認
- 後方互換性評価
```

This allows the methodology to learn and improve while maintaining stability. The constitution shows its own evolution with dated amendments, demonstrating how principles can be refined based on real-world experience.

これにより、安定性を維持しながら方法論が学習し改善することができます。憲法は、日付付きの修正により独自の進化を示し、実世界の経験に基づいて原則がどのように洗練されるかを実証しています。

### Beyond Rules: A Development Philosophy / ルールを超えて：開発哲学

The constitution isn't just a rulebook—it's a philosophy that shapes how LLMs think about code generation:

憲法は単なるルールブックではなく、LLMがコード生成について考える方法を形作る哲学です：

- **Observability Over Opacity**: Everything must be inspectable through CLI interfaces
- **Simplicity Over Cleverness**: Start simple, add complexity only when proven necessary
- **Integration Over Isolation**: Test in real environments, not artificial ones
- **Modularity Over Monoliths**: Every feature is a library with clear boundaries

- **不透明性より観測可能性**：すべてがCLIインターフェースを通じて検査可能でなければならない
- **巧妙さよりシンプリシティ**：シンプルに始め、必要性が証明された場合のみ複雑さを追加
- **分離より統合**：人工的な環境ではなく実際の環境でテスト
- **モノリスよりモジュラリティ**：すべての機能は明確な境界を持つライブラリ

By embedding these principles into the specification and planning process, SDD ensures that generated code isn't just functional—it's maintainable, testable, and architecturally sound. The constitution transforms AI from a code generator into an architectural partner that respects and reinforces system design principles.

これらの原則を仕様と計画プロセスに組み込むことで、SDDは生成されたコードが機能的であるだけでなく、保守可能で、テスト可能で、アーキテクチャ的に健全であることを保証します。憲法は、AIをコードジェネレーターから、システム設計原則を尊重し強化するアーキテクチャパートナーに変換します。

## The Transformation / 変革

This isn't about replacing developers or automating creativity. It's about amplifying human capability by automating mechanical translation. It's about creating a tight feedback loop where specifications, research, and code evolve together, each iteration bringing deeper understanding and better alignment between intent and implementation.

これは開発者を置き換えたり創造性を自動化したりすることではありません。機械的翻訳を自動化することで人間の能力を増幅することです。仕様、研究、コードが一緒に進化し、各反復がより深い理解と意図と実装の間のより良い整合性をもたらす、密接なフィードバックループを作成することです。

Software development needs better tools for maintaining alignment between intent and implementation. SDD provides the methodology for achieving this alignment through executable specifications that generate code rather than merely guiding it.

ソフトウェア開発は、意図と実装の間の整合性を維持するためのより良いツールを必要としています。SDDは、単にコードをガイドするのではなく、コードを生成する実行可能な仕様を通じて、この整合性を達成するための方法論を提供します。