#!/usr/bin/env bash

set -e

# Parse command line arguments
# コマンドライン引数を解析
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json) 
            JSON_MODE=true 
            ;;
        --help|-h) 
            echo "Usage: $0 [--json]"
            echo "使用法: $0 [--json]"
            echo "  --json    Output results in JSON format"
            echo "            結果をJSON形式で出力"
            echo "  --help    Show this help message"
            echo "            このヘルプメッセージを表示"
            exit 0 
            ;;
        *) 
            ARGS+=("$arg") 
            ;;
    esac
done

# Get script directory and load common functions
# スクリプトディレクトリを取得して共通関数を読み込み
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
# 共通関数からすべてのパスと変数を取得
eval $(get_feature_paths)

# Check if we're on a proper feature branch (only for git repos)
# 適切な機能ブランチにいるかチェック（gitリポジトリのみ）
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the feature directory exists
# 機能ディレクトリが存在することを確認
mkdir -p "$FEATURE_DIR"

# Copy plan template if it exists
# 計画テンプレートが存在する場合はコピー
TEMPLATE="$REPO_ROOT/.specify/templates/plan-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$IMPL_PLAN"
    echo "Copied plan template to $IMPL_PLAN"
else
    echo "Warning: Plan template not found at $TEMPLATE"
    # Create a basic plan file if template doesn't exist
    # テンプレートが存在しない場合は基本的な計画ファイルを作成
    touch "$IMPL_PLAN"
fi

# Output results
# 結果を出力
if $JSON_MODE; then
    printf '{"FEATURE_SPEC":"%s","IMPL_PLAN":"%s","SPECS_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$FEATURE_SPEC" "$IMPL_PLAN" "$FEATURE_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "FEATURE_SPEC: $FEATURE_SPEC"
    echo "IMPL_PLAN: $IMPL_PLAN" 
    echo "SPECS_DIR: $FEATURE_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi

