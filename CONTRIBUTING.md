以下は、あなたがアップロードした **`CONTRIBUTING.md`** の英語原文と日本語訳を並記したものです。
（見出しや箇条書きはできるだけ元の構造を保っています）

---

# Contributing to Spec Kit

# Spec Kit への貢献について

Hi there! We're thrilled that you'd like to contribute to Spec Kit. Contributions to this project are [released](https://help.github.com/articles/github-terms-of-service/#6-contributions-under-repository-license) to the public under the [project's open source license](LICENSE).
こんにちは！Spec Kit への貢献を検討してくださりありがとうございます。このプロジェクトへの貢献は、[プロジェクトのオープンソースライセンス](LICENSE) に基づき、[パブリックに公開](https://help.github.com/articles/github-terms-of-service/#6-contributions-under-repository-license) されます。

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
本プロジェクトは [貢献者行動規範 (Contributor Code of Conduct)](CODE_OF_CONDUCT.md) のもとで公開されています。参加することで、その規約に同意したものとみなされます。

---

## Prerequisites for running and testing code

## コードを実行・テストするための前提条件

These are one time installations required to be able to test your changes locally as part of the pull request (PR) submission process.
以下は、プルリクエスト（PR）を送る際にローカルで変更をテストできるようにするために、一度だけ必要なセットアップです。

1. Install [Python 3.11+](https://www.python.org/downloads/)
   　[Python 3.11 以上](https://www.python.org/downloads/) をインストール
2. Install [uv](https://docs.astral.sh/uv/) for package management
   　パッケージ管理ツール [uv](https://docs.astral.sh/uv/) をインストール
3. Install [Git](https://git-scm.com/downloads)
   　[Git](https://git-scm.com/downloads) をインストール
4. Have an [AI coding agent available](README.md#-supported-ai-agents)
   　[AI コーディングエージェント](README.md#-supported-ai-agents) を利用可能にしておく

---

## Submitting a pull request

## プルリクエストの提出方法

> [!NOTE]
> If your pull request introduces a large change that materially impacts the work of the CLI or the rest of the repository (e.g., you're introducing new templates, arguments, or otherwise major changes), make sure that it was **discussed and agreed upon** by the project maintainers. Pull requests with large changes that did not have a prior conversation and agreement will be closed.
> もしあなたのプルリクエストが CLI やリポジトリ全体に大きな影響を与える変更（例：新しいテンプレート、引数、または主要機能の追加）を含む場合は、事前にプロジェクトメンテナと**議論・合意**を得てください。事前の合意がない大きな変更の PR はクローズされます。

手順:

1. Fork and clone the repository
   　リポジトリをフォークし、クローン
2. Configure and install the dependencies: `uv sync`
   　依存関係を設定・インストール：`uv sync`
3. Make sure the CLI works on your machine: `uv run specify --help`
   　CLI が動作するか確認：`uv run specify --help`
4. Create a new branch: `git checkout -b my-branch-name`
   　新しいブランチを作成：`git checkout -b my-branch-name`
5. Make your change, add tests, and make sure everything still works
   　変更を加え、テストを追加し、全体が動作することを確認
6. Test the CLI functionality with a sample project if relevant
   　必要に応じてサンプルプロジェクトで CLI をテスト
7. Push to your fork and submit a pull request
   　フォークへ push してプルリクエストを提出
8. Wait for your pull request to be reviewed and merged.
   　レビューとマージを待つ

承認されやすくするためのポイント:

* プロジェクトのコーディング規約に従うこと
* 新機能にはテストを書くこと
* ユーザー向け機能に影響がある場合はドキュメント（`README.md`, `spec-driven.md`）を更新すること
* 変更をできるだけ焦点化すること（依存しない変更は別 PR にする）
* [良いコミットメッセージ](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)を書くこと
* Spec-Driven Development ワークフローで変更をテストし、互換性を確認すること

---

## Development workflow

## 開発ワークフロー

When working on spec-kit:
spec-kit を開発するときは以下を行います。

1. Test changes with the `specify` CLI commands (`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`) in your coding agent of choice
   　使用しているコーディングエージェント上で `specify` CLI コマンド（`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`）を使って変更をテスト
2. Verify templates are working correctly in `templates/` directory
   　`templates/` ディレクトリ内のテンプレートが正しく動作するか確認
3. Test script functionality in the `scripts/` directory
   　`scripts/` ディレクトリのスクリプト動作を確認
4. Ensure memory files (`memory/constitution.md`) are updated if major process changes are made
   　プロセス変更がある場合は `memory/constitution.md` を更新

---

## AI contributions in Spec Kit

## Spec Kit における AI 貢献について

> [!IMPORTANT]
> If you are using **any kind of AI assistance** to contribute to Spec Kit, it must be disclosed in the pull request or issue.
> Spec Kit への貢献に **いかなる種類の AI 支援** を使用している場合も、プルリクエストや issue に明記する必要があります。

We welcome and encourage the use of AI tools to help improve Spec Kit!
私たちは Spec Kit の改善に AI ツールを活用することを歓迎し、奨励しています。

However, AI assistance **must be disclosed**, including how extensively it was used.
ただし、AI をどの程度使用したかを含め、**必ず開示**してください。

例:

> This PR was written primarily by GitHub Copilot.
> この PR は主に GitHub Copilot によって作成されました。

> I consulted ChatGPT to understand the codebase but the solution was fully authored manually by myself.
> コードベースの理解に ChatGPT を使用しましたが、ソリューション自体はすべて自分で作成しました。

開示しない場合は、レビュアーにとって失礼であり、また適切なレビュー判断が困難になります。

---

### What we're looking for

### 求められる内容

AI 支援を受けた貢献では以下を満たしてください：

* **AI 使用の明確な開示**
* **人間による理解とテスト**
* **明確な根拠**（なぜ必要か、Spec Kit の目的と整合するか）
* **具体的な証拠**（テストケース・シナリオ・実例）
* **あなた自身の分析**（開発者体験など）

---

### What we'll close

### クローズ対象の貢献

以下のような場合、PR はクローズされる可能性があります。

* テストされていない変更
* Spec Kit のニーズに合わない一般的提案
* 人的レビューがない大量生成物

---

### Guidelines for success

### 成功のための指針

人間の理解・検証を示すことが重要です。
AI 生成のまま提出したものは、さらなる修正が必要と判断される可能性があります。
低品質な AI 生成変更を繰り返す貢献者は、制限される場合があります。

メンテナへの敬意を払い、AI 使用を開示してください。

---

## Resources

## 参考資料

* [Spec-Driven Development Methodology](./spec-driven.md)
* [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
* [Using Pull Requests](https://help.github.com/articles/about-pull-requests/)
* [GitHub Help](https://help.github.com)

---

必要であれば、この日本語訳をMarkdownファイル（例：`CONTRIBUTING_ja.md`）として生成することも可能です。作成しますか？
