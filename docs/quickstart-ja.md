# Quick Start Guide
> クイックスタートガイド

This guide will help you get started with Spec-Driven Development using Spec Kit.
> このガイドは、Spec Kitを使ってSpec-Driven Developmentを始めるための手順を説明します。

> NEW: All automation scripts now provide both Bash (`.sh`) and PowerShell (`.ps1`) variants. The `specify` CLI auto-selects based on OS unless you pass `--script sh|ps`.
> 新情報: すべての自動化スクリプトにBash（`.sh`）版とPowerShell（`.ps1`）版が用意されました。`--script sh|ps`を指定しない限り、`specify` CLIがOSに合わせて自動選択します。

## The 4-Step Process
> 4ステップのプロセス

### 1. Install Specify
> 1. Specifyをインストールする

Initialize your project depending on the coding agent you're using:
> 使用するコーディングエージェントに合わせてプロジェクトを初期化します。

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

Pick script type explicitly (optional):
> （任意）使用するスクリプトタイプを明示的に指定します。
```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME> --script ps  # Force PowerShell
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME> --script sh  # Force POSIX shell
```

### 2. Create the Spec
> 2. 仕様を作成する

Use the `/speckit.specify` command to describe what you want to build. Focus on the **what** and **why**, not the tech stack.
> `/speckit.specify`コマンドを使い、構築したいものを記述します。テックスタックではなく、**何を**そして**なぜ**を重視してください。

```bash
/speckit.specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```
> `/speckit.specify`の例 — 写真を複数のアルバムで管理し、日付ごとにグループ化しドラッグ&ドロップで並べ替え可能、アルバム内ではタイル状で写真をプレビューするアプリを要求しています。

### 3. Create a Technical Implementation Plan
> 3. 技術的な実装計画を作成する

Use the `/speckit.plan` command to provide your tech stack and architecture choices.
> `/speckit.plan`コマンドで、テックスタックやアーキテクチャの選択を指示します。

```bash
/speckit.plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```
> `/speckit.plan`の例 — Viteと最小限のライブラリを使用し、可能な限りプレーンなHTML/CSS/JavaScriptを用いて、画像はアップロードせずメタデータをローカルのSQLiteに保存するよう指示しています。

### 4. Break Down and Implement
> 4. 分解して実装する

Use `/speckit.tasks` to create an actionable task list, then ask your agent to implement the feature.
> `/speckit.tasks`で実行可能なタスクリストを生成し、その後エージェントに機能実装を依頼します。

## Detailed Example: Building Taskify
> 詳細な例: Taskifyを構築する

Here's a complete example of building a team productivity platform:
> チーム生産性プラットフォームを構築する例を示します。

### Step 1: Define Requirements with `/speckit.specify`
> ステップ1: `/speckit.specify`で要件を定義する

```text
Develop Taskify, a team productivity platform. It should allow users to create projects, add team members,
assign tasks, comment and move tasks between boards in Kanban style. In this initial phase for this feature,
let's call it "Create Taskify," let's have multiple users but the users will be declared ahead of time, predefined.
I want five users in two different categories, one product manager and four engineers. Let's create three
different sample projects. Let's have the standard Kanban columns for the status of each task, such as "To Do,"
"In Progress," "In Review," and "Done." There will be no login for this application as this is just the very
first testing thing to ensure that our basic features are set up. For each task in the UI for a task card,
you should be able to change the current status of the task between the different columns in the Kanban work board.
You should be able to leave an unlimited number of comments for a particular card. You should be able to, from that task
card, assign one of the valid users. When you first launch Taskify, it's going to give you a list of the five users to pick
from. There will be no password required. When you click on a user, you go into the main view, which displays the list of
projects. When you click on a project, you open the Kanban board for that project. You're going to see the columns.
You'll be able to drag and drop cards back and forth between different columns. You will see any cards that are
assigned to you, the currently logged in user, in a different color from all the other ones, so you can quickly
see yours. You can edit any comments that you make, but you can't edit comments that other people made. You can
delete any comments that you made, but you can't delete comments anybody else made.
```

> Taskifyというチーム生産性プラットフォームを開発します。ユーザーはプロジェクトを作成し、メンバーを追加し、タスクを割り当て、コメントし、タスクをカンバン形式のボード間で移動できる必要があります。「Taskifyを作成する」というこの初期段階では、ユーザーは事前に定義され、複数人とします。プロダクトマネージャー1名とエンジニア4名の計5名が必要です。サンプルプロジェクトを3つ用意し、各タスクのステータスには「To Do」「In Progress」「In Review」「Done」といった標準的なカンバン列を用意します。これは基本機能を確認するための最初のテストなのでログイン機能は不要です。タスクカードのUIでは、タスクのステータスをカンバンボード上の各列間で切り替えられるようにします。各カードにはコメントを無制限に残せるようにします。また、そのタスクカードから有効なユーザーを割り当てられるようにします。Taskifyを起動すると、最初に5人のユーザーのリストが表示され、そこから選択します。パスワードは不要です。ユーザーをクリックするとプロジェクトの一覧を表示するメインビューに遷移し、プロジェクトをクリックするとそのカンバンボードが開きます。列が表示され、カードを列間でドラッグ&ドロップできます。自分に割り当てられたカードは他とは異なる色で表示され、すぐに把握できます。自分が投稿したコメントは編集できますが、他人のコメントは編集できません。また、自分のコメントは削除できますが、他人のコメントは削除できません。

### Step 2: Refine the Specification
> ステップ2: 仕様を精緻化する

After the initial specification is created, clarify any missing requirements:
> 初期仕様の作成後、不足している要件を明確にします。

```text
For each sample project or project that you create there should be a variable number of tasks between 5 and 15
tasks for each one randomly distributed into different states of completion. Make sure that there's at least
one task in each stage of completion.
```

> 各サンプルプロジェクトまたは作成したプロジェクトには5〜15件のタスクを持たせ、さまざまな完了状態にランダムに割り振ります。各状態に少なくとも1件のタスクが存在するようにしてください。

Also validate the specification checklist:
> 仕様チェックリストも検証します。

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

> レビューおよび受け入れチェックリストを読み、機能仕様が基準を満たしている項目にチェックを入れてください。満たさない場合は空欄のままにします。

### Step 3: Generate Technical Plan with `/speckit.plan`
> ステップ3: `/speckit.plan`で技術計画を作成する

Be specific about your tech stack and technical requirements:
> テックスタックと技術要件を具体的に指定します。

```text
We are going to generate this using .NET Aspire, using Postgres as the database. The frontend should use
Blazor server with drag-and-drop task boards, real-time updates. There should be a REST API created with a projects API,
tasks API, and a notifications API.
```

> .NET Aspireを使用し、データベースにはPostgresを用います。フロントエンドはBlazor Serverで構築し、ドラッグ&ドロップ可能なタスクボードとリアルタイム更新を実装します。REST APIとしてProjects API、Tasks API、Notifications APIを用意します。

### Step 4: Validate and Implement
> ステップ4: 検証して実装する

Have your AI agent audit the implementation plan:
> AIエージェントに実装計画をレビューさせます。

```text
Now I want you to go and audit the implementation plan and the implementation detail files.
Read through it with an eye on determining whether or not there is a sequence of tasks that you need
to be doing that are obvious from reading this. Because I don't know if there's enough here.
```

> 実装計画と実装詳細ファイルをレビューし、そこから実行すべきタスクの順序が明確かどうかを確認してください。情報が十分かどうかを判断したいのです。

Finally, implement the solution:
> 最後に、ソリューションを実装します。

```text
implement specs/002-create-taskify/plan.md
```
> `specs/002-create-taskify/plan.md`の内容を実装します。

## Key Principles
> 重要な原則

- **Be explicit** about what you're building and why
> - **何をなぜ作るのかを明確に示す**
- **Don't focus on tech stack** during specification phase
> - 仕様策定段階で**テックスタックにこだわりすぎない**
- **Iterate and refine** your specifications before implementation
> - 実装前に**仕様を繰り返し磨き上げる**
- **Validate** the plan before coding begins
> - コーディングを始める前に**計画を検証する**
- **Let the AI agent handle** the implementation details
> - 実装の詳細は**AIエージェントに任せる**

## Next Steps
> 次のステップ

- Read the complete methodology for in-depth guidance
> - 詳細なガイダンスについて完全な手法ドキュメントを読む
- Check out more examples in the repository
> - リポジトリ内の追加例を確認する
- Explore the source code on GitHub
> - GitHubでソースコードを調査する
