---
description: "Task list template for feature implementation"
---
> description: "機能実装のためのタスクリストテンプレート"

# Tasks: [FEATURE NAME]
> タスク: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`
> **Input (入力)**: `/specs/[###-feature-name]/`配下の設計ドキュメント
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/
> **Prerequisites (前提条件)**: plan.md（必須）、spec.md（ユーザーストーリーに必須）、research.md、data-model.md、contracts/

**Tests**: The examples below include test tasks. Tests are OPTIONAL - only include them if explicitly requested in the feature specification.
> **Tests (テスト)**: 以下の例にはテストタスクが含まれます。テストは任意であり、機能仕様で明示的に求められた場合のみ追加してください。

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.
> **Organization (構成)**: 各ユーザーストーリーを独立して実装・テストできるよう、タスクをユーザーストーリー単位でグループ化します。

## Format: `[ID] [P?] [Story] Description`
> 書式: `[ID] [P?] [Story] 説明`
- **[P]**: Can run in parallel (different files, no dependencies)
> - **[P]**: 並行実行が可能（異なるファイルで依存関係なし）
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
> - **[Story]**: タスクが属するユーザーストーリー（例: US1、US2、US3）
- Include exact file paths in descriptions
> - 説明には正確なファイルパスを含めてください。

## Path Conventions
> パス命名規則
- **Single project**: `src/`, `tests/` at repository root
> - **単一プロジェクト**: リポジトリルート直下の`src/`、`tests/`
- **Web app**: `backend/src/`, `frontend/src/`
> - **Webアプリ**: `backend/src/`、`frontend/src/`
- **Mobile**: `api/src/`, `ios/src/` or `android/src/`
> - **モバイル**: `api/src/`、`ios/src/`または`android/src/`
- Paths shown below assume single project - adjust based on plan.md structure
> - 以下に示すパスは単一プロジェクトを想定しています。plan.mdで定義された構造に合わせて調整してください。

<!-- 
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.
  
  The /speckit.tasks command MUST replace these with actual tasks based on:
  - User stories from spec.md (with their priorities P1, P2, P3...)
  - Feature requirements from plan.md
  - Entities from data-model.md
  - Endpoints from contracts/
  
  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently
  - Delivered as an MVP increment
  
  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->
> 上記コメントは、以下のタスクがサンプル例であり、実際には`/speckit.tasks`コマンドが仕様に基づく実タスクへ置き換える必要があることを示します。

## Phase 1: Setup (Shared Infrastructure)
> フェーズ1: セットアップ（共通インフラ）

**Purpose**: Project initialization and basic structure
> **Purpose (目的)**: プロジェクトの初期化と基本構造の整備

- [ ] T001 Create project structure per implementation plan
> - [ ] T001 実装計画に沿ってプロジェクト構造を作成する
- [ ] T002 Initialize [language] project with [framework] dependencies
> - [ ] T002 [言語]プロジェクトを[フレームワーク]依存関係付きで初期化する
- [ ] T003 [P] Configure linting and formatting tools
> - [ ] T003 [P] Lintおよび整形ツールを設定する

---

## Phase 2: Foundational (Blocking Prerequisites)
> フェーズ2: 基盤構築（必須前提）

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented
> **Purpose (目的)**: ユーザーストーリーに着手する前に必ず完了させるべき基盤インフラ

**⚠️ CRITICAL**: No user story work can begin until this phase is complete
> **⚠️ 重要**: このフェーズが完了するまで、ユーザーストーリーの作業を開始してはいけません。

Examples of foundational tasks (adjust based on your project):
> 基盤タスクの例（プロジェクトに合わせて調整してください）:

- [ ] T004 Setup database schema and migrations framework
> - [ ] T004 データベーススキーマとマイグレーション基盤を設定する
- [ ] T005 [P] Implement authentication/authorization framework
> - [ ] T005 [P] 認証/認可フレームワークを実装する
- [ ] T006 [P] Setup API routing and middleware structure
> - [ ] T006 [P] APIルーティングとミドルウェア構造を設定する
- [ ] T007 Create base models/entities that all stories depend on
> - [ ] T007 すべてのストーリーが依存する基底モデル/エンティティを作成する
- [ ] T008 Configure error handling and logging infrastructure
> - [ ] T008 エラーハンドリングとログ基盤を構成する
- [ ] T009 Setup environment configuration management
> - [ ] T009 環境設定管理を整備する

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel
> **Checkpoint (チェックポイント)**: 基盤準備完了 — ここからユーザーストーリー実装を並行して開始できます。

---

## Phase 3: User Story 1 - [Title] (Priority: P1) 🎯 MVP
> フェーズ3: ユーザーストーリー1 - [タイトル] (優先度: P1) 🎯 MVP

**Goal**: [Brief description of what this story delivers]
> **Goal (目標)**: [このストーリーが提供する内容の概要]

**Independent Test**: [How to verify this story works on its own]
> **Independent Test (独立テスト)**: [このストーリー単独で動作を検証する方法]

### Tests for User Story 1 (OPTIONAL - only if tests requested) ⚠️
> ユーザーストーリー1のテスト（任意 — テストが要求された場合のみ）⚠️

**NOTE: Write these tests FIRST, ensure they FAIL before implementation**
> **注意: これらのテストは最初に作成し、実装前に失敗することを確認してください。**

- [ ] T010 [P] [US1] Contract test for [endpoint] in tests/contract/test_[name].py
> - [ ] T010 [P] [US1] tests/contract/test_[name].py で[エンドポイント]の契約テストを作成
- [ ] T011 [P] [US1] Integration test for [user journey] in tests/integration/test_[name].py
> - [ ] T011 [P] [US1] tests/integration/test_[name].py で[ユーザージャーニー]の統合テストを作成

### Implementation for User Story 1
> ユーザーストーリー1の実装

- [ ] T012 [P] [US1] Create [Entity1] model in src/models/[entity1].py
> - [ ] T012 [P] [US1] src/models/[entity1].py に[Entity1]モデルを作成
- [ ] T013 [P] [US1] Create [Entity2] model in src/models/[entity2].py
> - [ ] T013 [P] [US1] src/models/[entity2].py に[Entity2]モデルを作成
- [ ] T014 [US1] Implement [Service] in src/services/[service].py (depends on T012, T013)
> - [ ] T014 [US1] src/services/[service].py に[Service]を実装（T012、T013に依存）
- [ ] T015 [US1] Implement [endpoint/feature] in src/[location]/[file].py
> - [ ] T015 [US1] src/[location]/[file].py に[エンドポイント/機能]を実装
- [ ] T016 [US1] Add validation and error handling
> - [ ] T016 [US1] バリデーションとエラーハンドリングを追加
- [ ] T017 [US1] Add logging for user story 1 operations
> - [ ] T017 [US1] ユーザーストーリー1の処理にログを追加

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently
> **Checkpoint (チェックポイント)**: ユーザーストーリー1が完全に機能し、独立してテスト可能な状態になっていること

---

## Phase 4: User Story 2 - [Title] (Priority: P2)
> フェーズ4: ユーザーストーリー2 - [タイトル] (優先度: P2)

**Goal**: [Brief description of what this story delivers]
> **Goal (目標)**: [このストーリーが提供する内容の概要]

**Independent Test**: [How to verify this story works on its own]
> **Independent Test (独立テスト)**: [このストーリー単独で動作を検証する方法]

### Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️
> ユーザーストーリー2のテスト（任意 — テストが要求された場合のみ）⚠️

- [ ] T018 [P] [US2] Contract test for [endpoint] in tests/contract/test_[name].py
> - [ ] T018 [P] [US2] tests/contract/test_[name].py で[エンドポイント]の契約テストを作成
- [ ] T019 [P] [US2] Integration test for [user journey] in tests/integration/test_[name].py
> - [ ] T019 [P] [US2] tests/integration/test_[name].py で[ユーザージャーニー]の統合テストを作成

### Implementation for User Story 2
> ユーザーストーリー2の実装

- [ ] T020 [P] [US2] Create [Entity] model in src/models/[entity].py
> - [ ] T020 [P] [US2] src/models/[entity].py に[Entity]モデルを作成
- [ ] T021 [US2] Implement [Service] in src/services/[service].py
> - [ ] T021 [US2] src/services/[service].py に[Service]を実装
- [ ] T022 [US2] Implement [endpoint/feature] in src/[location]/[file].py
> - [ ] T022 [US2] src/[location]/[file].py に[エンドポイント/機能]を実装
- [ ] T023 [US2] Integrate with User Story 1 components (if needed)
> - [ ] T023 [US2] 必要に応じてユーザーストーリー1のコンポーネントと統合

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently
> **Checkpoint (チェックポイント)**: この時点でユーザーストーリー1と2の双方が独立して機能していること

---

## Phase 5: User Story 3 - [Title] (Priority: P3)
> フェーズ5: ユーザーストーリー3 - [タイトル] (優先度: P3)

**Goal**: [Brief description of what this story delivers]
> **Goal (目標)**: [このストーリーが提供する内容の概要]

**Independent Test**: [How to verify this story works on its own]
> **Independent Test (独立テスト)**: [このストーリー単独で動作を検証する方法]

### Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️
> ユーザーストーリー3のテスト（任意 — テストが要求された場合のみ）⚠️

- [ ] T024 [P] [US3] Contract test for [endpoint] in tests/contract/test_[name].py
> - [ ] T024 [P] [US3] tests/contract/test_[name].py で[エンドポイント]の契約テストを作成
- [ ] T025 [P] [US3] Integration test for [user journey] in tests/integration/test_[name].py
> - [ ] T025 [P] [US3] tests/integration/test_[name].py で[ユーザージャーニー]の統合テストを作成

### Implementation for User Story 3
> ユーザーストーリー3の実装

- [ ] T026 [P] [US3] Create [Entity] model in src/models/[entity].py
> - [ ] T026 [P] [US3] src/models/[entity].py に[Entity]モデルを作成
- [ ] T027 [US3] Implement [Service] in src/services/[service].py
> - [ ] T027 [US3] src/services/[service].py に[Service]を実装
- [ ] T028 [US3] Implement [endpoint/feature] in src/[location]/[file].py
> - [ ] T028 [US3] src/[location]/[file].py に[エンドポイント/機能]を実装

**Checkpoint**: All user stories should now be independently functional
> **Checkpoint (チェックポイント)**: すべてのユーザーストーリーが独立して機能していること

---

[Add more user story phases as needed, following the same pattern]
> [必要に応じて同じパターンでユーザーストーリーのフェーズを追加してください]

---

## Phase N: Polish & Cross-Cutting Concerns
> フェーズN: 仕上げと横断的課題

**Purpose**: Improvements that affect multiple user stories
> **Purpose (目的)**: 複数のユーザーストーリーに影響する改善

- [ ] TXXX [P] Documentation updates in docs/
> - [ ] TXXX [P] docs/ 内のドキュメントを更新
- [ ] TXXX Code cleanup and refactoring
> - [ ] TXXX コードのクリーンアップとリファクタリング
- [ ] TXXX Performance optimization across all stories
> - [ ] TXXX 全ユーザーストーリーにわたる性能最適化
- [ ] TXXX [P] Additional unit tests (if requested) in tests/unit/
> - [ ] TXXX [P] 要求があればtests/unit/に追加のユニットテストを作成
- [ ] TXXX Security hardening
> - [ ] TXXX セキュリティ強化
- [ ] TXXX Run quickstart.md validation
> - [ ] TXXX quickstart.mdの手順検証を実施

---

## Dependencies & Execution Order
> 依存関係と実行順序

### Phase Dependencies
> フェーズ間の依存関係

- **Setup (Phase 1)**: No dependencies - can start immediately
> - **Setup (フェーズ1)**: 依存関係なし — すぐに開始可能
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
> - **Foundational (フェーズ2)**: セットアップ完了に依存 — すべてのユーザーストーリーの前提条件
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
> - **User Stories (フェーズ3+)**: すべて基盤フェーズの完了に依存します
  - User stories can then proceed in parallel (if staffed)
>   - 人員が揃っていればユーザーストーリーは並行で進められます。
  - Or sequentially in priority order (P1 → P2 → P3)
>   - または優先度順（P1 → P2 → P3）に順次実施します。
- **Polish (Final Phase)**: Depends on all desired user stories being complete
> - **Polish (最終フェーズ)**: 実施対象のユーザーストーリーがすべて完了している必要があります。

### User Story Dependencies
> ユーザーストーリー間の依存関係

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
> - **ユーザーストーリー1 (P1)**: 基盤フェーズ完了後に開始可能。他ストーリーへの依存なし。
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with US1 but should be independently testable
> - **ユーザーストーリー2 (P2)**: 基盤フェーズ完了後に開始可能。US1と統合する場合があっても、独立テスト可能であるべきです。
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with US1/US2 but should be independently testable
> - **ユーザーストーリー3 (P3)**: 基盤フェーズ完了後に開始可能。US1/US2と統合する場合があっても、独立テスト可能であるべきです。

### Within Each User Story
> 各ユーザーストーリー内での順序

- Tests (if included) MUST be written and FAIL before implementation
> - テスト（実施する場合）は実装前に記述し、失敗することを確認してください。
- Models before services
> - モデルを先に実装し、その後サービスを実装します。
- Services before endpoints
> - サービスを先に、エンドポイントを後に実装します。
- Core implementation before integration
> - 統合前にコア機能を実装します。
- Story complete before moving to next priority
> - 次の優先度に進む前に、現在のストーリーを完了させてください。

### Parallel Opportunities
> 並行作業の機会

- All Setup tasks marked [P] can run in parallel
> - [P]が付いたセットアップタスクはすべて並行実行可能です。
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
> - フェーズ2内の[P]付き基盤タスクは並行実行可能です。
- Once Foundational phase completes, all user stories can start in parallel (if team capacity allows)
> - 基盤フェーズ完了後は、チーム体制が許せば全ユーザーストーリーを並行開始できます。
- All tests for a user story marked [P] can run in parallel
> - ユーザーストーリー内で[P]が付いたテストは並行実行可能です。
- Models within a story marked [P] can run in parallel
> - ストーリー内の[P]付きモデル作業は並行実行可能です。
- Different user stories can be worked on in parallel by different team members
> - 異なるユーザーストーリーは別々のメンバーが並行で担当できます。

---

## Parallel Example: User Story 1
> 並行実行の例: ユーザーストーリー1

```bash
# Launch all tests for User Story 1 together (if tests requested):
Task: "Contract test for [endpoint] in tests/contract/test_[name].py"
Task: "Integration test for [user journey] in tests/integration/test_[name].py"
```
> 上記コマンド例は、ユーザーストーリー1向けテストをまとめて実行するイメージです（テストが要求された場合）。
