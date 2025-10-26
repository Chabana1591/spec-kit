# Local Development Guide
> ローカル開発ガイド

This guide shows how to iterate on the `specify` CLI locally without publishing a release or committing to `main` first.
> このガイドでは、リリースを公開したり`main`にコミットしたりする前に、ローカル環境で`specify` CLIを繰り返し改善する方法を説明します。

> Scripts now have both Bash (`.sh`) and PowerShell (`.ps1`) variants. The CLI auto-selects based on OS unless you pass `--script`.
> スクリプトにはBash（`.sh`）版とPowerShell（`.ps1`）版の両方が用意されています。`--script`を指定しない限り、CLIはOSに応じて自動選択します。

## 1. Clone and Switch Branches
> 1. リポジトリをクローンしてブランチを切り替える

```bash
git clone https://github.com/github/spec-kit.git
cd spec-kit
# Work on a feature branch
git checkout -b your-feature-branch
```

## 2. Run the CLI Directly (Fastest Feedback)
> 2. CLIを直接実行する（最速のフィードバック）

You can execute the CLI via the module entrypoint without installing anything:
> 何もインストールせずにモジュールのエントリポイントからCLIを実行できます。

```bash
# From repo root
python -m src.specify_cli --help
python -m src.specify_cli init demo-project --ai claude --ignore-agent-tools --script sh
```

If you prefer invoking the script file style (uses shebang):
> シバンを利用したスクリプトファイル形式で実行したい場合:

```bash
python src/specify_cli/__init__.py init demo-project --script ps
```

## 3. Use Editable Install (Isolated Environment)
> 3. 編集可能インストールを使用する（分離された環境）

Create an isolated environment using `uv` so dependencies resolve exactly like end users get them:
> `uv`を使って分離された環境を作成し、エンドユーザーと同じ依存関係解決を再現します。

```bash
# Create & activate virtual env (uv auto-manages .venv)
uv venv
source .venv/bin/activate  # or on Windows PowerShell: .venv\Scripts\Activate.ps1

# Install project in editable mode
uv pip install -e .

# Now 'specify' entrypoint is available
specify --help
```

Re-running after code edits requires no reinstall because of editable mode.
> 編集可能モードのため、コードを編集しても再インストールは不要です。

## 4. Invoke with uvx Directly From Git (Current Branch)
> 4. uvxでGitリポジトリから直接実行する（現在のブランチ）

`uvx` can run from a local path (or a Git ref) to simulate user flows:
> `uvx`はローカルパスやGit参照から実行でき、実際のユーザーフローを再現できます。

```bash
uvx --from . specify init demo-uvx --ai copilot --ignore-agent-tools --script sh
```

You can also point uvx at a specific branch without merging:
> マージせずに特定のブランチを指定してuvxを実行することも可能です。

```bash
# Push your working branch first
git push origin your-feature-branch
uvx --from git+https://github.com/github/spec-kit.git@your-feature-branch specify init demo-branch-test --script ps
```

### 4a. Absolute Path uvx (Run From Anywhere)
> 4a. 絶対パスでuvxを使う（任意の場所から実行）

If you're in another directory, use an absolute path instead of `.`:
> 別のディレクトリにいる場合は、`.`の代わりに絶対パスを使用します。

```bash
uvx --from /mnt/c/GitHub/spec-kit specify --help
uvx --from /mnt/c/GitHub/spec-kit specify init demo-anywhere --ai copilot --ignore-agent-tools --script sh
```

Set an environment variable for convenience:
> 利便性のために環境変数を設定します。
```bash
export SPEC_KIT_SRC=/mnt/c/GitHub/spec-kit
uvx --from "$SPEC_KIT_SRC" specify init demo-env --ai copilot --ignore-agent-tools --script ps
```

(Optional) Define a shell function:
> （任意）シェル関数を定義します。
```bash
specify-dev() { uvx --from /mnt/c/GitHub/spec-kit specify "$@"; }
# Then
specify-dev --help
```

## 5. Testing Script Permission Logic
> 5. スクリプトの権限ロジックをテストする

After running an `init`, check that shell scripts are executable on POSIX systems:
> `init`実行後、POSIXシステムでシェルスクリプトに実行権限が付与されているか確認します。

```bash
ls -l scripts | grep .sh
# Expect owner execute bit (e.g. -rwxr-xr-x)
```
On Windows you will instead use the `.ps1` scripts (no chmod needed).
> Windowsでは代わりに`.ps1`スクリプトを使用するため、chmodは不要です。

## 6. Run Lint / Basic Checks (Add Your Own)
> 6. Lintや基本チェックを実行する（必要に応じて追加）

Currently no enforced lint config is bundled, but you can quickly sanity check importability:
> まだLint設定は同梱されていませんが、インポート可能かどうかの簡易チェックを行えます。
```bash
python -c "import specify_cli; print('Import OK')"
```

## 7. Build a Wheel Locally (Optional)
> 7. ローカルでWheelをビルドする（任意）

Validate packaging before publishing:
> 公開前にパッケージングを検証します。

```bash
uv build
ls dist/
```
Install the built artifact into a fresh throwaway environment if needed.
> 必要に応じて、ビルド済みアーティファクトを使い捨て環境にインストールしてください。

## 8. Using a Temporary Workspace
> 8. 一時的なワークスペースを使用する

When testing `init --here` in a dirty directory, create a temp workspace:
> `init --here`を未整理のディレクトリでテストする場合は、一時ワークスペースを作成します。

```bash
mkdir /tmp/spec-test && cd /tmp/spec-test
python -m src.specify_cli init --here --ai claude --ignore-agent-tools --script sh  # if repo copied here
```
Or copy only the modified CLI portion if you want a lighter sandbox.
> より軽量なサンドボックスが必要な場合は、変更したCLI部分だけをコピーします。

## 9. Debug Network / TLS Skips
> 9. ネットワーク／TLSスキップのデバッグ

If you need to bypass TLS validation while experimenting:
> 検証中にTLS検証を回避する必要がある場合:

```bash
specify check --skip-tls
specify init demo --skip-tls --ai gemini --ignore-agent-tools --script ps
```
(Use only for local experimentation.)
> （ローカルでの実験目的にのみ使用してください。）

## 10. Rapid Edit Loop Summary
> 10. 高速編集ループのまとめ

| Action | Command |
|--------|---------|
| Run CLI directly | `python -m src.specify_cli --help` |
| Editable install | `uv pip install -e .` then `specify ...` |
| Local uvx run (repo root) | `uvx --from . specify ...` |
| Local uvx run (abs path) | `uvx --from /mnt/c/GitHub/spec-kit specify ...` |
| Git branch uvx | `uvx --from git+URL@branch specify ...` |
| Build wheel | `uv build` |
> 上表は主要な操作と対応するコマンドの概要です。

| 操作 | コマンド |
|------|----------|
| CLIを直接実行 | `python -m src.specify_cli --help` |
| 編集可能インストール | `uv pip install -e .` の後に `specify ...` |
| ローカルuvx実行（リポジトリルート） | `uvx --from . specify ...` |
| ローカルuvx実行（絶対パス） | `uvx --from /mnt/c/GitHub/spec-kit specify ...` |
| Gitブランチuvx | `uvx --from git+URL@branch specify ...` |
| Wheelをビルド | `uv build` |

## 11. Cleaning Up
> 11. クリーンアップ

Remove build artifacts / virtual env quickly:
> ビルド成果物や仮想環境を素早く削除します。
```bash
rm -rf .venv dist build *.egg-info
```

## 12. Common Issues
> 12. よくある問題

| Symptom | Fix |
|---------|-----|
| `ModuleNotFoundError: typer` | Run `uv pip install -e .` |
| Scripts not executable (Linux) | Re-run init or `chmod +x scripts/*.sh` |
| Git step skipped | You passed `--no-git` or Git not installed |
| Wrong script type downloaded | Pass `--script sh` or `--script ps` explicitly |
| TLS errors on corporate network | Try `--skip-tls` (not for production) |
> 主な症状と対処法は次の通りです。

| 症状 | 対処法 |
|------|--------|
| `ModuleNotFoundError: typer` | `uv pip install -e .` を実行する |
| スクリプトに実行権限がない（Linux） | initを再実行するか `chmod +x scripts/*.sh` を実行する |
| Gitステップがスキップされる | `--no-git`を指定したか、Gitがインストールされていない |
| 誤ったスクリプトタイプがダウンロードされた | `--script sh` または `--script ps` を明示的に指定する |
| 企業ネットワークでTLSエラーが発生 | `--skip-tls`を試す（本番では使用しない） |

## 13. Next Steps
> 13. 次のステップ

- Update docs and run through Quick Start using your modified CLI
> - ドキュメントを更新し、変更したCLIでクイックスタートを試してください。
- Open a PR when satisfied
> - 満足できたらPRを作成します。
- (Optional) Tag a release once changes land in `main`
> - （任意）変更が`main`に反映されたらリリースタグを作成します。
