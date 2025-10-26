# Documentation
> ドキュメント

This folder contains the documentation source files for Spec Kit, built using [DocFX](https://dotnet.github.io/docfx/).
> このフォルダーには、[DocFX](https://dotnet.github.io/docfx/)で構築されたSpec Kitのドキュメントソースファイルが含まれています。

## Building Locally
> ローカルでのビルド

To build the documentation locally:
> ドキュメントをローカルでビルドするには次の手順を実行します。

1. Install DocFX:
> 1. DocFXをインストールします。
   ```bash
   dotnet tool install -g docfx
   ```

2. Build the documentation:
> 2. ドキュメントをビルドします。
   ```bash
   cd docs
   docfx docfx.json --serve
   ```

3. Open your browser to `http://localhost:8080` to view the documentation.
> 3. ブラウザーで`http://localhost:8080`を開き、ドキュメントを確認します。

## Structure
> 構成

- `docfx.json` - DocFX configuration file
> - `docfx.json` — DocFXの設定ファイル
- `index.md` - Main documentation homepage
> - `index.md` — ドキュメントのメインホームページ
- `toc.yml` - Table of contents configuration
> - `toc.yml` — 目次の設定
- `installation.md` - Installation guide
> - `installation.md` — インストールガイド
- `quickstart.md` - Quick start guide
> - `quickstart.md` — クイックスタートガイド
- `_site/` - Generated documentation output (ignored by git)
> - `_site/` — 生成されたドキュメントの出力（gitでは無視）

## Deployment
> デプロイ

Documentation is automatically built and deployed to GitHub Pages when changes are pushed to the `main` branch. The workflow is defined in `.github/workflows/docs.yml`.
> `main`ブランチに変更がプッシュされると、ドキュメントは自動的にビルドされGitHub Pagesにデプロイされます。ワークフローは`.github/workflows/docs.yml`で定義されています。
