# Implementation Plan: [FEATURE]
> 実装計画: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
> **Branch (ブランチ)**: `[###-feature-name]` | **Date (日付)**: [DATE] | **Spec (仕様)**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`
> **Input (入力)**: `/specs/[###-feature-name]/spec.md`の機能仕様

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.
> **Note (注意)**: このテンプレートは`/speckit.plan`コマンドによって自動的に埋められます。実行手順は`.specify/templates/commands/plan.md`を参照してください。

## Summary
> 概要

[Extract from feature spec: primary requirement + technical approach from research]
> [機能仕様から抽出: 主要要件とリサーチによる技術的アプローチ]

## Technical Context
> 技術的コンテキスト

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->
> 上記コメントは、本セクションをプロジェクト固有の技術情報に置き換える必要があることを示します。構造は反復を導くための指針です。

**Language/Version**: [e.g., Python 3.11, Swift 5.9, Rust 1.75 or NEEDS CLARIFICATION]  
> **Language/Version (言語・バージョン)**: [例: Python 3.11、Swift 5.9、Rust 1.75 または 要確認]
**Primary Dependencies**: [e.g., FastAPI, UIKit, LLVM or NEEDS CLARIFICATION]  
> **Primary Dependencies (主要依存関係)**: [例: FastAPI、UIKit、LLVM など、または 要確認]
**Storage**: [if applicable, e.g., PostgreSQL, CoreData, files or N/A]  
> **Storage (ストレージ)**: [該当する場合: PostgreSQL、CoreData、ファイル など / 該当なし]
**Testing**: [e.g., pytest, XCTest, cargo test or NEEDS CLARIFICATION]  
> **Testing (テスト)**: [例: pytest、XCTest、cargo test または 要確認]
**Target Platform**: [e.g., Linux server, iOS 15+, WASM or NEEDS CLARIFICATION]
> **Target Platform (対象プラットフォーム)**: [例: Linuxサーバー、iOS 15以上、WASM など または 要確認]
**Project Type**: [single/web/mobile - determines source structure]  
> **Project Type (プロジェクトタイプ)**: [単一 / Web / モバイル — ソース構造を決定します]
**Performance Goals**: [domain-specific, e.g., 1000 req/s, 10k lines/sec, 60 fps or NEEDS CLARIFICATION]  
> **Performance Goals (性能目標)**: [ドメイン固有: 例 1000 req/s、10k lines/sec、60 fps または 要確認]
**Constraints**: [domain-specific, e.g., <200ms p95, <100MB memory, offline-capable or NEEDS CLARIFICATION]  
> **Constraints (制約)**: [ドメイン固有: 例 p95 <200ms、メモリ <100MB、オフライン対応など または 要確認]
**Scale/Scope**: [domain-specific, e.g., 10k users, 1M LOC, 50 screens or NEEDS CLARIFICATION]
> **Scale/Scope (規模・範囲)**: [ドメイン固有: 例 1万人のユーザー、100万行のコード、50画面など または 要確認]

## Constitution Check
> 憲章チェック

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*
> *ゲート条件: フェーズ0のリサーチ前に合格必須。フェーズ1の設計後に再確認してください。*

[Gates determined based on constitution file]
> [憲章ファイルに基づいて決定されるゲート項目]

## Project Structure
> プロジェクト構造

### Documentation (this feature)
> ドキュメント（本機能）

```
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```
> 上記は本機能のドキュメント構成例です。必要に応じて実際のファイル構成に置き換えてください。

### Source Code (repository root)
> ソースコード（リポジトリルート）
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths (e.g., apps/admin, packages/something). The delivered plan must
  not include Option labels.
-->
> 次のコード構造はプレースホルダーです。対象機能に合わせて具体的なレイアウトに置き換え、未使用のオプションを削除してください。提出する計画書に「Option」の文言は残さないでください。

```
# [REMOVE IF UNUSED] Option 1: Single project (DEFAULT)
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [REMOVE IF UNUSED] Option 2: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/

# [REMOVE IF UNUSED] Option 3: Mobile + API (when "iOS/Android" detected)
api/
└── [same as backend above]

ios/ or android/
└── [platform-specific structure: feature modules, UI flows, platform tests]
```
> 上記の構造例から適切なものを選び、不要な部分を削除して実際のディレクトリ構成を記載してください。

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]
> **Structure Decision (構造の決定)**: [選択した構造と前述の実ディレクトリをここに記録します]

## Complexity Tracking
> 複雑性トラッキング

*Fill ONLY if Constitution Check has violations that must be justified*
> *憲章チェックで違反が見つかり、正当化が必要な場合のみ記入してください。*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
> 違反内容・必要理由・却下した簡易代替案を上表に記入します。
