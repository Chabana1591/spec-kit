#!/usr/bin/env bash

# Consolidated prerequisite checking script
# 統合前提条件チェックスクリプト
#
# This script provides unified prerequisite checking for Spec-Driven Development workflow.
# このスクリプトは、仕様駆動開発ワークフローの統一前提条件チェックを提供します。
# It replaces the functionality previously spread across multiple scripts.
# 以前複数のスクリプトに分散していた機能を置き換えます。
#
# Usage: ./check-prerequisites.sh [OPTIONS]
# 使用法: ./check-prerequisites.sh [オプション]
#
# OPTIONS:
# オプション:
#   --json              Output in JSON format
#                       JSON形式で出力
#   --require-tasks     Require tasks.md to exist (for implementation phase)
#                       tasks.mdの存在を必須とする（実装フェーズ用）
#   --include-tasks     Include tasks.md in AVAILABLE_DOCS list
#                       AVAILABLE_DOCSリストにtasks.mdを含める
#   --paths-only        Only output path variables (no validation)
#                       パス変数のみ出力（検証なし）
#   --help, -h          Show help message
#                       ヘルプメッセージを表示
#
# OUTPUTS:
# 出力:
#   JSON mode: {"FEATURE_DIR":"...", "AVAILABLE_DOCS":["..."]}
#   JSONモード: {"FEATURE_DIR":"...", "AVAILABLE_DOCS":["..."]}
#   Text mode: FEATURE_DIR:... \n AVAILABLE_DOCS: \n ✓/✗ file.md
#   テキストモード: FEATURE_DIR:... \n AVAILABLE_DOCS: \n ✓/✗ file.md
#   Paths only: REPO_ROOT: ... \n BRANCH: ... \n FEATURE_DIR: ... etc.
#   パスのみ: REPO_ROOT: ... \n BRANCH: ... \n FEATURE_DIR: ... など

set -e

# Parse command line arguments
JSON_MODE=false
REQUIRE_TASKS=false
INCLUDE_TASKS=false
PATHS_ONLY=false

for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --require-tasks)
            REQUIRE_TASKS=true
            ;;
        --include-tasks)
            INCLUDE_TASKS=true
            ;;
        --paths-only)
            PATHS_ONLY=true
            ;;
        --help|-h)
            cat << 'EOF'
Usage: check-prerequisites.sh [OPTIONS]
使用法: check-prerequisites.sh [オプション]

Consolidated prerequisite checking for Spec-Driven Development workflow.
仕様駆動開発ワークフローの統合前提条件チェック

OPTIONS:
オプション:
  --json              Output in JSON format
                      JSON形式で出力
  --require-tasks     Require tasks.md to exist (for implementation phase)
                      tasks.mdの存在を必須とする（実装フェーズ用）
  --include-tasks     Include tasks.md in AVAILABLE_DOCS list
                      AVAILABLE_DOCSリストにtasks.mdを含める
  --paths-only        Only output path variables (no prerequisite validation)
                      パス変数のみ出力（前提条件検証なし）
  --help, -h          Show this help message
                      このヘルプメッセージを表示

EXAMPLES:
例:
  # Check task prerequisites (plan.md required)
  # タスク前提条件をチェック（plan.md必須）
  ./check-prerequisites.sh --json
  
  # Check implementation prerequisites (plan.md + tasks.md required)
  # 実装前提条件をチェック（plan.md + tasks.md必須）
  ./check-prerequisites.sh --json --require-tasks --include-tasks
  
  # Get feature paths only (no validation)
  # 機能パスのみ取得（検証なし）
  ./check-prerequisites.sh --paths-only
  
EOF
            exit 0
            ;;
        *)
            echo "ERROR: Unknown option '$arg'. Use --help for usage information." >&2
            exit 1
            ;;
    esac
done

# Source common functions
# 共通関数をソース
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get feature paths and validate branch
# 機能パスを取得してブランチを検証
eval $(get_feature_paths)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# If paths-only mode, output paths and exit (support JSON + paths-only combined)
# パスのみモードの場合、パスを出力して終了（JSON とパスのみの併用をサポート）
if $PATHS_ONLY; then
    if $JSON_MODE; then
        # Minimal JSON paths payload (no validation performed)
        # 最小限の JSON パス情報（検証は実施しない）
        printf '{"REPO_ROOT":"%s","BRANCH":"%s","FEATURE_DIR":"%s","FEATURE_SPEC":"%s","IMPL_PLAN":"%s","TASKS":"%s"}\n' \
            "$REPO_ROOT" "$CURRENT_BRANCH" "$FEATURE_DIR" "$FEATURE_SPEC" "$IMPL_PLAN" "$TASKS"
    else
        echo "REPO_ROOT: $REPO_ROOT"
        echo "BRANCH: $CURRENT_BRANCH"
        echo "FEATURE_DIR: $FEATURE_DIR"
        echo "FEATURE_SPEC: $FEATURE_SPEC"
        echo "IMPL_PLAN: $IMPL_PLAN"
        echo "TASKS: $TASKS"
    fi
    exit 0
fi

# Validate required directories and files
# 必須ディレクトリとファイルを検証
if [[ ! -d "$FEATURE_DIR" ]]; then
    echo "ERROR: Feature directory not found: $FEATURE_DIR" >&2
    echo "Run /speckit.specify first to create the feature structure." >&2
    exit 1
fi

if [[ ! -f "$IMPL_PLAN" ]]; then
    echo "ERROR: plan.md not found in $FEATURE_DIR" >&2
    echo "Run /speckit.plan first to create the implementation plan." >&2
    exit 1
fi

# Check for tasks.md if required
# 必要に応じて tasks.md の存在を確認
if $REQUIRE_TASKS && [[ ! -f "$TASKS" ]]; then
    echo "ERROR: tasks.md not found in $FEATURE_DIR" >&2
    echo "Run /speckit.tasks first to create the task list." >&2
    exit 1
fi

# Build list of available documents
# 利用可能なドキュメントの一覧を構築
docs=()

# Always check these optional docs
# 任意ドキュメントについて常に存在確認
[[ -f "$RESEARCH" ]] && docs+=("research.md")
[[ -f "$DATA_MODEL" ]] && docs+=("data-model.md")

# Check contracts directory (only if it exists and has files)
# contracts ディレクトリが存在し、中にファイルがある場合のみ確認
if [[ -d "$CONTRACTS_DIR" ]] && [[ -n "$(ls -A "$CONTRACTS_DIR" 2>/dev/null)" ]]; then
    docs+=("contracts/")
fi

[[ -f "$QUICKSTART" ]] && docs+=("quickstart.md")

# Include tasks.md if requested and it exists
# 指定された場合に限り tasks.md が存在すれば追加
if $INCLUDE_TASKS && [[ -f "$TASKS" ]]; then
    docs+=("tasks.md")
fi

# Output results
# 結果を出力
if $JSON_MODE; then
    # Build JSON array of documents
    # ドキュメントの JSON 配列を構築
    if [[ ${#docs[@]} -eq 0 ]]; then
        json_docs="[]"
    else
        json_docs=$(printf '"%s",' "${docs[@]}")
        json_docs="[${json_docs%,}]"
    fi
    
    printf '{"FEATURE_DIR":"%s","AVAILABLE_DOCS":%s}\n' "$FEATURE_DIR" "$json_docs"
else
    # Text output
    # テキスト出力
    echo "FEATURE_DIR:$FEATURE_DIR"
    echo "AVAILABLE_DOCS:"
    
    # Show status of each potential document
    # 各候補ドキュメントの状態を表示
    check_file "$RESEARCH" "research.md"
    check_file "$DATA_MODEL" "data-model.md"
    check_dir "$CONTRACTS_DIR" "contracts/"
    check_file "$QUICKSTART" "quickstart.md"
    
    if $INCLUDE_TASKS; then
        check_file "$TASKS" "tasks.md"
    fi
fi
