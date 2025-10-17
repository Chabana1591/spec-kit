# Feature Specification: [FEATURE NAME]
> 機能仕様: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`  
> **Feature Branch (機能ブランチ)**: `[###-feature-name]`
**Created**: [DATE]  
> **Created (作成日)**: [DATE]
**Status**: Draft  
> **Status (ステータス)**: Draft（ドラフト）
**Input**: User description: "$ARGUMENTS"
> **Input (入力)**: ユーザー説明: "$ARGUMENTS"

## User Scenarios & Testing *(mandatory)*
> ユーザーシナリオとテスト *(必須)*

<!--
  IMPORTANT: User stories should be PRIORITIZED as user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value.
  
  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone slice of functionality that can be:
  - Developed independently
  - Tested independently
  - Deployed independently
  - Demonstrated to users independently
-->
> 上記コメントは、ユーザーストーリーを重要度順に優先付けし、それぞれを独立してテスト可能な単位として扱う必要があることを示します。各ストーリーは単独で開発・テスト・デプロイ・デモ可能でなければなりません。

### User Story 1 - [Brief Title] (Priority: P1)
> ユーザーストーリー1 - [簡単なタイトル] (優先度: P1)

[Describe this user journey in plain language]
> [このユーザージャーニーを平易な言葉で説明します]

**Why this priority**: [Explain the value and why it has this priority level]
> **Why this priority (優先度の理由)**: [この優先度が付与された理由と価値を説明します]

**Independent Test**: [Describe how this can be tested independently - e.g., "Can be fully tested by [specific action] and delivers [specific value]"]
> **Independent Test (独立テスト)**: [どのように独立してテストできるかを記述します。例: 「[具体的な操作]で完全に検証でき、[具体的な価値]を提供する」]

**Acceptance Scenarios**:
> **Acceptance Scenarios (受け入れシナリオ)**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]
> 1. **前提** [初期状態]、**もし** [アクション] なら、**その結果** [期待される結果]
2. **Given** [initial state], **When** [action], **Then** [expected outcome]
> 2. **前提** [初期状態]、**もし** [アクション] なら、**その結果** [期待される結果]

---

### User Story 2 - [Brief Title] (Priority: P2)
> ユーザーストーリー2 - [簡単なタイトル] (優先度: P2)

[Describe this user journey in plain language]
> [このユーザージャーニーを平易な言葉で説明します]

**Why this priority**: [Explain the value and why it has this priority level]
> **Why this priority (優先度の理由)**: [価値と優先度の理由を説明します]

**Independent Test**: [Describe how this can be tested independently]
> **Independent Test (独立テスト)**: [独立したテスト方法を記述します]

**Acceptance Scenarios**:
> **Acceptance Scenarios (受け入れシナリオ)**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]
> 1. **前提** [初期状態]、**もし** [アクション] なら、**その結果** [期待される結果]

---

### User Story 3 - [Brief Title] (Priority: P3)
> ユーザーストーリー3 - [簡単なタイトル] (優先度: P3)

[Describe this user journey in plain language]
> [このユーザージャーニーを平易な言葉で説明します]

**Why this priority**: [Explain the value and why it has this priority level]
> **Why this priority (優先度の理由)**: [価値と優先度の理由を説明します]

**Independent Test**: [Describe how this can be tested independently]
> **Independent Test (独立テスト)**: [独立したテスト方法を記述します]

**Acceptance Scenarios**:
> **Acceptance Scenarios (受け入れシナリオ)**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]
> 1. **前提** [初期状態]、**もし** [アクション] なら、**その結果** [期待される結果]

---

[Add more user stories as needed, each with an assigned priority]
> [必要に応じてユーザーストーリーを追加し、それぞれに優先度を設定してください]

### Edge Cases
> エッジケース

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right edge cases.
-->
> このセクションはプレースホルダーです。適切なエッジケースで置き換えてください。

- What happens when [boundary condition]?
> - [境界条件] の場合はどうなりますか?
- How does system handle [error scenario]?
> - システムは [エラーシナリオ] をどのように処理しますか?

## Requirements *(mandatory)*
> 要件 *(必須)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right functional requirements.
-->
> このセクションはプレースホルダーです。適切な機能要件に置き換えてください。

### Functional Requirements
> 機能要件

- **FR-001**: System MUST [specific capability, e.g., "allow users to create accounts"]
> - **FR-001**: システムは[具体的な機能 例: 「ユーザーがアカウントを作成できるようにする」]必要があります。
- **FR-002**: System MUST [specific capability, e.g., "validate email addresses"]  
> - **FR-002**: システムは[具体的な機能 例: 「メールアドレスを検証する」]必要があります。
- **FR-003**: Users MUST be able to [key interaction, e.g., "reset their password"]
> - **FR-003**: ユーザーは[重要な操作 例: 「パスワードをリセットできる」]必要があります。
- **FR-004**: System MUST [data requirement, e.g., "persist user preferences"]
> - **FR-004**: システムは[データ要件 例: 「ユーザーの設定を永続化する」]必要があります。
- **FR-005**: System MUST [behavior, e.g., "log all security events"]
> - **FR-005**: システムは[動作要件 例: 「すべてのセキュリティイベントを記録する」]必要があります。

*Example of marking unclear requirements:*
> *不明確な要件に印を付ける例:*

- **FR-006**: System MUST authenticate users via [NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?]
> - **FR-006**: システムはユーザーを[要確認: 認証方法が未指定（メール/パスワード、SSO、OAuth?）]で認証する必要があります。
- **FR-007**: System MUST retain user data for [NEEDS CLARIFICATION: retention period not specified]
> - **FR-007**: システムはユーザーデータを[要確認: 保存期間が未指定]保持する必要があります。

### Key Entities *(include if feature involves data)*
> 主要エンティティ *(機能がデータを扱う場合に記載)*

- **[Entity 1]**: [What it represents, key attributes without implementation]
> - **[Entity 1]**: [何を表すか、主要属性（実装詳細を含めない）]
- **[Entity 2]**: [What it represents, relationships to other entities]
> - **[Entity 2]**: [何を表すか、他のエンティティとの関係]

## Success Criteria *(mandatory)*
> 成功基準 *(必須)*

<!--
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic and measurable.
-->
> 計測可能な成功基準を定義してください。テクノロジーに依存せず測定可能である必要があります。

### Measurable Outcomes
> 測定可能な成果

- **SC-001**: [Measurable metric, e.g., "Users can complete account creation in under 2 minutes"]
> - **SC-001**: [測定可能な指標 例: 「ユーザーが2分以内にアカウント作成を完了できる」]
- **SC-002**: [Measurable metric, e.g., "System handles 1000 concurrent users without degradation"]
> - **SC-002**: [測定可能な指標 例: 「システムが劣化なく1000人の同時ユーザーを処理できる」]
- **SC-003**: [User satisfaction metric, e.g., "90% of users successfully complete primary task on first attempt"]
> - **SC-003**: [ユーザー満足度指標 例: 「ユーザーの90%が初回で主要タスクを完了できる」]
- **SC-004**: [Business metric, e.g., "Reduce support tickets related to [X] by 50%"]
> - **SC-004**: [ビジネス指標 例: 「[X]に関連するサポートチケットを50%削減する」]
