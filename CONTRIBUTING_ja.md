# Spec Kit への貢献について

こんにちは！Spec Kit への貢献を検討してくださりありがとうございます。このプロジェクトへの貢献は、[プロジェクトのオープンソースライセンス](LICENSE) に基づき、[パブリックに公開](https://help.github.com/articles/github-terms-of-service/#6-contributions-under-repository-license) されます。

本プロジェクトは [貢献者行動規範 (Contributor Code of Conduct)](CODE_OF_CONDUCT.md) のもとで公開されています。参加することで、その規約に同意したものとみなされます。

---

## コードを実行・テストするための前提条件

以下は、プルリクエスト（PR）を送る際にローカルで変更をテストできるようにするために、一度だけ必要なセットアップです。

1. [Python 3.11 以上](https://www.python.org/downloads/) をインストール
2. パッケージ管理ツール [uv](https://docs.astral.sh/uv/) をインストール
3. [Git](https://git-scm.com/downloads) をインストール
4. [AI コーディングエージェント](README.md#-supported-ai-agents) を利用可能にしておく

---

## プルリクエストの提出方法

> **注意**  
> もしあなたのプルリクエストが CLI やリポジトリ全体に大きな影響を与える変更（例：新しいテンプレート、引数、または主要機能の追加）を含む場合は、事前にプロジェクトメンテナと**議論・合意**を得てください。事前の合意がない大きな変更の PR はクローズされます。

手順:

1. リポジトリをフォークし、クローン
2. 依存関係を設定・インストール：`uv sync`
3. CLI が動作するか確認：`uv run specify --help`
4. 新しいブランチを作成：`git checkout -b my-branch-name`
5. 変更を加え、テストを追加し、全体が動作することを確認
6. 必要に応じてサンプルプロジェクトで CLI をテスト
7. フォークへ push してプルリクエストを提出
8. レビューとマージを待つ

承認されやすくするためのポイント:

- プロジェクトのコーディング規約に従うこと
- 新機能にはテストを書くこと
- ユーザー向け機能に影響がある場合はドキュメント（`README.md`, `spec-driven.md`）を更新すること
- 変更をできるだけ焦点化すること（依存しない変更は別 PR にする）
- [良いコミットメッセージ](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)を書くこと
- Spec-Driven Development ワークフローで変更をテストし、互換性を確認すること

---

## 開発ワークフロー

spec-kit を開発するときは以下を行います。

1. 使用しているコーディングエージェント上で `specify` CLI コマンド（`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`）を使って変更をテスト
2. `templates/` ディレクトリ内のテンプレートが正しく動作するか確認
3. `scripts/` ディレクトリのスクリプト動作を確認
4. プロセス変更がある場合は `memory/constitution.md` を更新

---

## Spec Kit における AI 貢献について

> **重要**  
> Spec Kit への貢献に **いかなる種類の AI 支援** を使用している場合も、プルリクエストや issue に明記する必要があります。

私たちは Spec Kit の改善に AI ツールを活用することを歓迎し、奨励しています。  
ただし、AI をどの程度使用したかを含め、**必ず開示**してください。

例:

> この PR は主に GitHub Copilot によって作成されました。  
> コードベースの理解に ChatGPT を使用しましたが、ソリューション自体はすべて自分で作成しました。

開示しない場合は、レビュアーにとって失礼であり、また適切なレビュー判断が困難になります。

---

### 求められる内容

AI 支援を受けた貢献では以下を満たしてください：

- **AI 使用の明確な開示**
- **人間による理解とテスト**
- **明確な根拠**（なぜ必要か、Spec Kit の目的と整合するか）
- **具体的な証拠**（テストケース・シナリオ・実例）
- **あなた自身の分析**（開発者体験など）

---

### クローズ対象の貢献

以下のような場合、PR はクローズされる可能性があります。

- テストされていない変更
- Spec Kit のニーズに合わない一般的提案
- 人的レビューがない大量生成物

---

### 成功のための指針

人間の理解・検証を示すことが重要です。  
AI 生成のまま提出したものは、さらなる修正が必要と判断される可能性があります。  
低品質な AI 生成変更を繰り返す貢献者は、制限される場合があります。  

メンテナへの敬意を払い、AI 使用を開示してください。

---

## 参考資料

- [Spec-Driven Development Methodology](./spec-driven.md)
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
- [Using Pull Requests](https://help.github.com/articles/about-pull-requests/)
- [GitHub Help](https://help.github.com)
