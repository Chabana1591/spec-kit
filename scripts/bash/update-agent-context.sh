#!/usr/bin/env bash

# Update agent context files with information from plan.md
# plan.mdの情報でエージェントコンテキストファイルを更新
#
# This script maintains AI agent context files by parsing feature specifications 
# このスクリプトは機能仕様を解析してAIエージェントコンテキストファイルを保守します
# and updating agent-specific configuration files with project information.
# そしてエージェント固有の設定ファイルをプロジェクト情報で更新します。
#
# MAIN FUNCTIONS:
# 主要機能:
# 1. Environment Validation
#    環境検証
#    - Verifies git repository structure and branch information
#      gitリポジトリ構造とブランチ情報を検証
#    - Checks for required plan.md files and templates
#      必要なplan.mdファイルとテンプレートをチェック
#    - Validates file permissions and accessibility
#      ファイル権限とアクセス性を検証
#
# 2. Plan Data Extraction
#    計画データ抽出
#    - Parses plan.md files to extract project metadata
#      プロジェクトメタデータを抽出するためplan.mdファイルを解析
#    - Identifies language/version, frameworks, databases, and project types
#      言語/バージョン、フレームワーク、データベース、プロジェクトタイプを特定
#    - Handles missing or incomplete specification data gracefully
#      不足または不完全な仕様データを適切に処理
#
# 3. Agent File Management
#    エージェントファイル管理
#    - Creates new agent context files from templates when needed
#      必要に応じてテンプレートから新しいエージェントコンテキストファイルを作成
#    - Updates existing agent files with new project information
#      新しいプロジェクト情報で既存のエージェントファイルを更新
#    - Preserves manual additions and custom configurations
#      手動追加とカスタム設定を保持
#    - Supports multiple AI agent formats and directory structures
#      複数のAIエージェント形式とディレクトリ構造をサポート
#
# 4. Content Generation
#    コンテンツ生成
#    - Generates language-specific build/test commands
#      言語固有のビルド/テストコマンドを生成
#    - Creates appropriate project directory structures
#      適切なプロジェクトディレクトリ構造を作成
#    - Updates technology stacks and recent changes sections
#      技術スタックと最近の変更セクションを更新
#    - Maintains consistent formatting and timestamps
#      一貫したフォーマットとタイムスタンプを維持
#
# 5. Multi-Agent Support
#    マルチエージェントサポート
#    - Handles agent-specific file paths and naming conventions
#      エージェント固有のファイルパスと命名規則を処理
#    - Supports: Claude, Gemini, Copilot, Cursor, Qwen, opencode, Codex, Windsurf, Kilo Code, Auggie CLI, or Amazon Q Developer CLI
#      サポート: Claude, Gemini, Copilot, Cursor, Qwen, opencode, Codex, Windsurf, Kilo Code, Auggie CLI, Amazon Q Developer CLI
#    - Can update single agents or all existing agent files
#      単一エージェントまたはすべての既存エージェントファイルを更新可能
#    - Creates default Claude file if no agent files exist
#      エージェントファイルが存在しない場合はデフォルトのClaudeファイルを作成
#
# Usage: ./update-agent-context.sh [agent_type]
# 使用法: ./update-agent-context.sh [エージェントタイプ]
# Agent types: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|q
# エージェントタイプ: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|q
# Leave empty to update all existing agent files
# すべての既存エージェントファイルを更新する場合は空のままにする

set -e

# Enable strict error handling
# 厳密なエラー処理を有効化
set -u
set -o pipefail

#==============================================================================
# Configuration and Global Variables
# 設定とグローバル変数
#==============================================================================

# Get script directory and load common functions
# スクリプトディレクトリを取得して共通関数を読み込み
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
# 共通関数からすべてのパスと変数を取得
eval $(get_feature_paths)

NEW_PLAN="$IMPL_PLAN"  # Alias for compatibility with existing code
                       # 既存コードとの互換性のためのエイリアス
AGENT_TYPE="${1:-}"

# Agent-specific file paths
# エージェント固有のファイルパス
CLAUDE_FILE="$REPO_ROOT/CLAUDE.md"
GEMINI_FILE="$REPO_ROOT/GEMINI.md"
COPILOT_FILE="$REPO_ROOT/.github/copilot-instructions.md"
CURSOR_FILE="$REPO_ROOT/.cursor/rules/specify-rules.mdc"
QWEN_FILE="$REPO_ROOT/QWEN.md"
AGENTS_FILE="$REPO_ROOT/AGENTS.md"
WINDSURF_FILE="$REPO_ROOT/.windsurf/rules/specify-rules.md"
KILOCODE_FILE="$REPO_ROOT/.kilocode/rules/specify-rules.md"
AUGGIE_FILE="$REPO_ROOT/.augment/rules/specify-rules.md"
ROO_FILE="$REPO_ROOT/.roo/rules/specify-rules.md"
CODEBUDDY_FILE="$REPO_ROOT/CODEBUDDY.md"
Q_FILE="$REPO_ROOT/AGENTS.md"

# Template file
# テンプレートファイル
TEMPLATE_FILE="$REPO_ROOT/.specify/templates/agent-file-template.md"

# Global variables for parsed plan data
# 解析された計画データ用のグローバル変数
NEW_LANG=""
NEW_FRAMEWORK=""
NEW_DB=""
NEW_PROJECT_TYPE=""

#==============================================================================
# Utility Functions
# ユーティリティ関数
#==============================================================================

log_info() {
    echo "INFO: $1"
}

log_success() {
    echo "✓ $1"
}

log_error() {
    echo "ERROR: $1" >&2
}

log_warning() {
    echo "WARNING: $1" >&2
}

# Cleanup function for temporary files
# 一時ファイル用のクリーンアップ関数
cleanup() {
    local exit_code=$?
    rm -f /tmp/agent_update_*_$$
    rm -f /tmp/manual_additions_$$
    exit $exit_code
}

# Set up cleanup trap
# クリーンアップトラップを設定
trap cleanup EXIT INT TERM

#==============================================================================
# Validation Functions
# 検証関数
#==============================================================================

validate_environment() {
    # Check if we have a current branch/feature (git or non-git)
    # 現在のブランチ/機能があるかチェック（gitまたは非git）
    if [[ -z "$CURRENT_BRANCH" ]]; then
        log_error "Unable to determine current feature"
        # 現在の機能を決定できません
        if [[ "$HAS_GIT" == "true" ]]; then
            log_info "Make sure you're on a feature branch"
            # 機能ブランチにいることを確認してください
        else
            log_info "Set SPECIFY_FEATURE environment variable or create a feature first"
            # SPECIFY_FEATURE環境変数を設定するか、最初に機能を作成してください
        fi
        exit 1
    fi
    
    # Check if plan.md exists
    # plan.mdが存在するかチェック
    if [[ ! -f "$NEW_PLAN" ]]; then
        log_error "No plan.md found at $NEW_PLAN"
        # $NEW_PLANにplan.mdが見つかりません
        log_info "Make sure you're working on a feature with a corresponding spec directory"
        # 対応する仕様ディレクトリを持つ機能で作業していることを確認してください
        if [[ "$HAS_GIT" != "true" ]]; then
            log_info "Use: export SPECIFY_FEATURE=your-feature-name or create a new feature first"
            # 使用法: export SPECIFY_FEATURE=your-feature-name または最初に新しい機能を作成
        fi
        exit 1
    fi
    
    # Check if template exists (needed for new files)
    # テンプレートが存在するかチェック（新しいファイルに必要）
    if [[ ! -f "$TEMPLATE_FILE" ]]; then
        log_warning "Template file not found at $TEMPLATE_FILE"
        # $TEMPLATE_FILEにテンプレートファイルが見つかりません
        log_warning "Creating new agent files will fail"
        # 新しいエージェントファイルの作成は失敗します
    fi
}

#==============================================================================
# Plan Parsing Functions
# 計画解析関数
#==============================================================================

extract_plan_field() {
    local field_pattern="$1"
    local plan_file="$2"
    
    grep "^\*\*${field_pattern}\*\*: " "$plan_file" 2>/dev/null | \
        head -1 | \
        sed "s|^\*\*${field_pattern}\*\*: ||" | \
        sed 's/^[ \t]*//;s/[ \t]*$//' | \
        grep -v "NEEDS CLARIFICATION" | \
        grep -v "^N/A$" || echo ""
}

parse_plan_data() {
    local plan_file="$1"
    
    if [[ ! -f "$plan_file" ]]; then
        log_error "Plan file not found: $plan_file"
        # 計画ファイルが見つかりません: $plan_file
        return 1
    fi
    
    if [[ ! -r "$plan_file" ]]; then
        log_error "Plan file is not readable: $plan_file"
        # 計画ファイルが読み取り不可: $plan_file
        return 1
    fi
    
    log_info "Parsing plan data from $plan_file"
    # $plan_fileから計画データを解析中
    
    NEW_LANG=$(extract_plan_field "Language/Version" "$plan_file")
    NEW_FRAMEWORK=$(extract_plan_field "Primary Dependencies" "$plan_file")
    NEW_DB=$(extract_plan_field "Storage" "$plan_file")
    NEW_PROJECT_TYPE=$(extract_plan_field "Project Type" "$plan_file")
    
    # Log what we found
    # 見つかったものをログ出力
    if [[ -n "$NEW_LANG" ]]; then
        log_info "Found language: $NEW_LANG"
        # 言語を発見: $NEW_LANG
    else
        log_warning "No language information found in plan"
        # 計画で言語情報が見つかりません
    fi
    
    if [[ -n "$NEW_FRAMEWORK" ]]; then
        log_info "Found framework: $NEW_FRAMEWORK"
        # フレームワークを発見: $NEW_FRAMEWORK
    fi
    
    if [[ -n "$NEW_DB" ]] && [[ "$NEW_DB" != "N/A" ]]; then
        log_info "Found database: $NEW_DB"
        # データベースを発見: $NEW_DB
    fi
    
    if [[ -n "$NEW_PROJECT_TYPE" ]]; then
        log_info "Found project type: $NEW_PROJECT_TYPE"
        # プロジェクトタイプを発見: $NEW_PROJECT_TYPE
    fi
}

format_technology_stack() {
    local lang="$1"
    local framework="$2"
    local parts=()
    
    # Add non-empty parts
    # 空でない部分を追加
    [[ -n "$lang" && "$lang" != "NEEDS CLARIFICATION" ]] && parts+=("$lang")
    [[ -n "$framework" && "$framework" != "NEEDS CLARIFICATION" && "$framework" != "N/A" ]] && parts+=("$framework")
    
    # Join with proper formatting
    # 適切なフォーマットで結合
    if [[ ${#parts[@]} -eq 0 ]]; then
        echo ""
    elif [[ ${#parts[@]} -eq 1 ]]; then
        echo "${parts[0]}"
    else
        # Join multiple parts with " + "
        # 複数の部分を " + " で結合
        local result="${parts[0]}"
        for ((i=1; i<${#parts[@]}; i++)); do
            result="$result + ${parts[i]}"
        done
        echo "$result"
    fi
}

#==============================================================================
# Template and Content Generation Functions
# テンプレートとコンテンツ生成関数
#==============================================================================

get_project_structure() {
    local project_type="$1"
    
    if [[ "$project_type" == *"web"* ]]; then
        echo "backend/\\nfrontend/\\ntests/"
    else
        echo "src/\\ntests/"
    fi
}

get_commands_for_language() {
    local lang="$1"
    
    case "$lang" in
        *"Python"*)
            echo "cd src && pytest && ruff check ."
            ;;
        *"Rust"*)
            echo "cargo test && cargo clippy"
            ;;
        *"JavaScript"*|*"TypeScript"*)
            echo "npm test \&\& npm run lint"
            ;;
        *)
            echo "# Add commands for $lang"
            # $lang用のコマンドを追加
            ;;
    esac
}

get_language_conventions() {
    local lang="$1"
    echo "$lang: Follow standard conventions"
    # $lang: 標準的な規約に従う
}

create_new_agent_file() {
    local target_file="$1"
    local temp_file="$2"
    local project_name="$3"
    local current_date="$4"
    
    if [[ ! -f "$TEMPLATE_FILE" ]]; then
        log_error "Template not found at $TEMPLATE_FILE"
        # $TEMPLATE_FILEにテンプレートが見つかりません
        return 1
    fi
    
    if [[ ! -r "$TEMPLATE_FILE" ]]; then
        log_error "Template file is not readable: $TEMPLATE_FILE"
        # テンプレートファイルが読み取り不可: $TEMPLATE_FILE
        return 1
    fi
    
    log_info "Creating new agent context file from template..."
    # テンプレートから新しいエージェントコンテキストファイルを作成中...
    
    if ! cp "$TEMPLATE_FILE" "$temp_file"; then
        log_error "Failed to copy template file"
        # テンプレートファイルのコピーに失敗
        return 1
    fi
    
    # Replace template placeholders
    # テンプレートプレースホルダーを置換
    local project_structure
    project_structure=$(get_project_structure "$NEW_PROJECT_TYPE")
    
    local commands
    commands=$(get_commands_for_language "$NEW_LANG")
    
    local language_conventions
    language_conventions=$(get_language_conventions "$NEW_LANG")
    
    # Perform substitutions with error checking using safer approach
    # より安全なアプローチを使用してエラーチェック付きで置換を実行
    # Escape special characters for sed by using a different delimiter or escaping
    # 異なるデリミタまたはエスケープを使用してsed用の特殊文字をエスケープ
    local escaped_lang=$(printf '%s\n' "$NEW_LANG" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    local escaped_framework=$(printf '%s\n' "$NEW_FRAMEWORK" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    local escaped_branch=$(printf '%s\n' "$CURRENT_BRANCH" | sed 's/[\[\.*^$()+{}|]/\\&/g')
    
    # Build technology stack and recent change strings conditionally
    # 技術スタックと最近の変更文字列を条件付きで構築
    local tech_stack
    if [[ -n "$escaped_lang" && -n "$escaped_framework" ]]; then
        tech_stack="- $escaped_lang + $escaped_framework ($escaped_branch)"
    elif [[ -n "$escaped_lang" ]]; then
        tech_stack="- $escaped_lang ($escaped_branch)"
    elif [[ -n "$escaped_framework" ]]; then
        tech_stack="- $escaped_framework ($escaped_branch)"
    else
        tech_stack="- ($escaped_branch)"
    fi

    local recent_change
    if [[ -n "$escaped_lang" && -n "$escaped_framework" ]]; then
        recent_change="- $escaped_branch: Added $escaped_lang + $escaped_framework"
    elif [[ -n "$escaped_lang" ]]; then
        recent_change="- $escaped_branch: Added $escaped_lang"
    elif [[ -n "$escaped_framework" ]]; then
        recent_change="- $escaped_branch: Added $escaped_framework"
    else
        recent_change="- $escaped_branch: Added"
    fi

    local substitutions=(
        "s|\[PROJECT NAME\]|$project_name|"
        "s|\[DATE\]|$current_date|"
        "s|\[EXTRACTED FROM ALL PLAN.MD FILES\]|$tech_stack|"
        "s|\[ACTUAL STRUCTURE FROM PLANS\]|$project_structure|g"
        "s|\[ONLY COMMANDS FOR ACTIVE TECHNOLOGIES\]|$commands|"
        "s|\[LANGUAGE-SPECIFIC, ONLY FOR LANGUAGES IN USE\]|$language_conventions|"
        "s|\[LAST 3 FEATURES AND WHAT THEY ADDED\]|$recent_change|"
    )
    
    for substitution in "${substitutions[@]}"; do
        if ! sed -i.bak -e "$substitution" "$temp_file"; then
            log_error "Failed to perform substitution: $substitution"
            # 置換の実行に失敗: $substitution
            rm -f "$temp_file" "$temp_file.bak"
            return 1
        fi
    done
    
    # Convert \n sequences to actual newlines
    # \n シーケンスを実際の改行に変換
    newline=$(printf '\n')
    sed -i.bak2 "s/\\\\n/${newline}/g" "$temp_file"
    
    # Clean up backup files
    # バックアップファイルをクリーンアップ
    rm -f "$temp_file.bak" "$temp_file.bak2"
    
    return 0
}




update_existing_agent_file() {
    local target_file="$1"
    local current_date="$2"
    
    log_info "Updating existing agent context file..."
    # 既存のエージェントコンテキストファイルを更新中...
    
    # Use a single temporary file for atomic update
    # アトミック更新のため単一の一時ファイルを使用
    local temp_file
    temp_file=$(mktemp) || {
        log_error "Failed to create temporary file"
        # 一時ファイルの作成に失敗
        return 1
    }
    
    # Process the file in one pass
    # ファイルを1回のパスで処理
    local tech_stack=$(format_technology_stack "$NEW_LANG" "$NEW_FRAMEWORK")
    local new_tech_entries=()
    local new_change_entry=""
    
    # Prepare new technology entries
    # 新しい技術エントリを準備
    if [[ -n "$tech_stack" ]] && ! grep -q "$tech_stack" "$target_file"; then
        new_tech_entries+=("- $tech_stack ($CURRENT_BRANCH)")
    fi
    
    if [[ -n "$NEW_DB" ]] && [[ "$NEW_DB" != "N/A" ]] && [[ "$NEW_DB" != "NEEDS CLARIFICATION" ]] && ! grep -q "$NEW_DB" "$target_file"; then
        new_tech_entries+=("- $NEW_DB ($CURRENT_BRANCH)")
    fi
    
    # Prepare new change entry
    # 新しい変更エントリを準備
    if [[ -n "$tech_stack" ]]; then
        new_change_entry="- $CURRENT_BRANCH: Added $tech_stack"
    elif [[ -n "$NEW_DB" ]] && [[ "$NEW_DB" != "N/A" ]] && [[ "$NEW_DB" != "NEEDS CLARIFICATION" ]]; then
        new_change_entry="- $CURRENT_BRANCH: Added $NEW_DB"
    fi
    
    # Process file line by line
    # ファイルを1行ずつ処理
    local in_tech_section=false
    local in_changes_section=false
    local tech_entries_added=false
    local changes_entries_added=false
    local existing_changes_count=0
    
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Handle Active Technologies section
        # Active Technologiesセクションを処理
        if [[ "$line" == "## Active Technologies" ]]; then
            echo "$line" >> "$temp_file"
            in_tech_section=true
            continue
        elif [[ $in_tech_section == true ]] && [[ "$line" =~ ^##[[:space:]] ]]; then
            # Add new tech entries before closing the section
            if [[ $tech_entries_added == false ]] && [[ ${#new_tech_entries[@]} -gt 0 ]]; then
                printf '%s\n' "${new_tech_entries[@]}" >> "$temp_file"
                tech_entries_added=true
            fi
            echo "$line" >> "$temp_file"
            in_tech_section=false
            continue
        elif [[ $in_tech_section == true ]] && [[ -z "$line" ]]; then
            # Add new tech entries before empty line in tech section
            # 技術セクションの空行前に新しい技術エントリを追加
            if [[ $tech_entries_added == false ]] && [[ ${#new_tech_entries[@]} -gt 0 ]]; then
                printf '%s\n' "${new_tech_entries[@]}" >> "$temp_file"
                tech_entries_added=true
            fi
            echo "$line" >> "$temp_file"
            continue
        fi
        
        # Handle Recent Changes section
        # Recent Changesセクションを処理
        if [[ "$line" == "## Recent Changes" ]]; then
            echo "$line" >> "$temp_file"
            # Add new change entry right after the heading
            # 見出しの直後に新しい変更エントリを追加
            if [[ -n "$new_change_entry" ]]; then
                echo "$new_change_entry" >> "$temp_file"
            fi
            in_changes_section=true
            changes_entries_added=true
            continue
        elif [[ $in_changes_section == true ]] && [[ "$line" =~ ^##[[:space:]] ]]; then
            echo "$line" >> "$temp_file"
            in_changes_section=false
            continue
        elif [[ $in_changes_section == true ]] && [[ "$line" == "- "* ]]; then
            # Keep only first 2 existing changes
            # 最初の2つの既存変更のみを保持
            if [[ $existing_changes_count -lt 2 ]]; then
                echo "$line" >> "$temp_file"
                ((existing_changes_count++))
            fi
            continue
        fi
        
        # Update timestamp
        # タイムスタンプを更新
        if [[ "$line" =~ \*\*Last\ updated\*\*:.*[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] ]]; then
            echo "$line" | sed "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/$current_date/" >> "$temp_file"
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$target_file"
    
    # Post-loop check: if we're still in the Active Technologies section and haven't added new entries
    # ループ後チェック: まだActive Technologiesセクションにいて新しいエントリを追加していない場合
    if [[ $in_tech_section == true ]] && [[ $tech_entries_added == false ]] && [[ ${#new_tech_entries[@]} -gt 0 ]]; then
        printf '%s\n' "${new_tech_entries[@]}" >> "$temp_file"
    fi
    
    # Move temp file to target atomically
    # 一時ファイルをターゲットにアトミックに移動
    if ! mv "$temp_file" "$target_file"; then
        log_error "Failed to update target file"
        # ターゲットファイルの更新に失敗
        rm -f "$temp_file"
        return 1
    fi
    
    return 0
}
#==============================================================================
# Main Agent File Update Function
# メインエージェントファイル更新関数
#==============================================================================

update_agent_file() {
    local target_file="$1"
    local agent_name="$2"
    
    if [[ -z "$target_file" ]] || [[ -z "$agent_name" ]]; then
        log_error "update_agent_file requires target_file and agent_name parameters"
        # update_agent_fileにはtarget_fileとagent_nameパラメータが必要です
        return 1
    fi
    
    log_info "Updating $agent_name context file: $target_file"
    # $agent_nameコンテキストファイルを更新中: $target_file
    
    local project_name
    project_name=$(basename "$REPO_ROOT")
    local current_date
    current_date=$(date +%Y-%m-%d)
    
    # Create directory if it doesn't exist
    # ディレクトリが存在しない場合は作成
    local target_dir
    target_dir=$(dirname "$target_file")
    if [[ ! -d "$target_dir" ]]; then
        if ! mkdir -p "$target_dir"; then
            log_error "Failed to create directory: $target_dir"
            # ディレクトリの作成に失敗: $target_dir
            return 1
        fi
    fi
    
    if [[ ! -f "$target_file" ]]; then
        # Create new file from template
        # テンプレートから新しいファイルを作成
        local temp_file
        temp_file=$(mktemp) || {
            log_error "Failed to create temporary file"
            # 一時ファイルの作成に失敗
            return 1
        }
        
        if create_new_agent_file "$target_file" "$temp_file" "$project_name" "$current_date"; then
            if mv "$temp_file" "$target_file"; then
                log_success "Created new $agent_name context file"
                # 新しい$agent_nameコンテキストファイルを作成しました
            else
                log_error "Failed to move temporary file to $target_file"
                # 一時ファイルの$target_fileへの移動に失敗
                rm -f "$temp_file"
                return 1
            fi
        else
            log_error "Failed to create new agent file"
            # 新しいエージェントファイルの作成に失敗
            rm -f "$temp_file"
            return 1
        fi
    else
        # Update existing file
        # 既存ファイルを更新
        if [[ ! -r "$target_file" ]]; then
            log_error "Cannot read existing file: $target_file"
            # 既存ファイルを読み取れません: $target_file
            return 1
        fi
        
        if [[ ! -w "$target_file" ]]; then
            log_error "Cannot write to existing file: $target_file"
            # 既存ファイルに書き込めません: $target_file
            return 1
        fi
        
        if update_existing_agent_file "$target_file" "$current_date"; then
            log_success "Updated existing $agent_name context file"
            # 既存の$agent_nameコンテキストファイルを更新しました
        else
            log_error "Failed to update existing agent file"
            # 既存エージェントファイルの更新に失敗
            return 1
        fi
    fi
    
    return 0
}

#==============================================================================
# Agent Selection and Processing
# エージェント選択と処理
#==============================================================================

update_specific_agent() {
    local agent_type="$1"
    
    case "$agent_type" in
        claude)
            update_agent_file "$CLAUDE_FILE" "Claude Code"
            ;;
        gemini)
            update_agent_file "$GEMINI_FILE" "Gemini CLI"
            ;;
        copilot)
            update_agent_file "$COPILOT_FILE" "GitHub Copilot"
            ;;
        cursor-agent)
            update_agent_file "$CURSOR_FILE" "Cursor IDE"
            ;;
        qwen)
            update_agent_file "$QWEN_FILE" "Qwen Code"
            ;;
        opencode)
            update_agent_file "$AGENTS_FILE" "opencode"
            ;;
        codex)
            update_agent_file "$AGENTS_FILE" "Codex CLI"
            ;;
        windsurf)
            update_agent_file "$WINDSURF_FILE" "Windsurf"
            ;;
        kilocode)
            update_agent_file "$KILOCODE_FILE" "Kilo Code"
            ;;
        auggie)
            update_agent_file "$AUGGIE_FILE" "Auggie CLI"
            ;;
        roo)
            update_agent_file "$ROO_FILE" "Roo Code"
            ;;
        codebuddy)
            update_agent_file "$CODEBUDDY_FILE" "CodeBuddy CLI"
            ;;
        q)
            update_agent_file "$Q_FILE" "Amazon Q Developer CLI"
            ;;
        *)
            log_error "Unknown agent type '$agent_type'"
            # 未知のエージェントタイプ '$agent_type'
            log_error "Expected: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|q"
            # 期待値: claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|roo|q
            exit 1
            ;;
    esac
}

update_all_existing_agents() {
    local found_agent=false
    
    # Check each possible agent file and update if it exists
    # 各可能なエージェントファイルをチェックし、存在する場合は更新
    if [[ -f "$CLAUDE_FILE" ]]; then
        update_agent_file "$CLAUDE_FILE" "Claude Code"
        found_agent=true
    fi
    
    if [[ -f "$GEMINI_FILE" ]]; then
        update_agent_file "$GEMINI_FILE" "Gemini CLI"
        found_agent=true
    fi
    
    if [[ -f "$COPILOT_FILE" ]]; then
        update_agent_file "$COPILOT_FILE" "GitHub Copilot"
        found_agent=true
    fi
    
    if [[ -f "$CURSOR_FILE" ]]; then
        update_agent_file "$CURSOR_FILE" "Cursor IDE"
        found_agent=true
    fi
    
    if [[ -f "$QWEN_FILE" ]]; then
        update_agent_file "$QWEN_FILE" "Qwen Code"
        found_agent=true
    fi
    
    if [[ -f "$AGENTS_FILE" ]]; then
        update_agent_file "$AGENTS_FILE" "Codex/opencode"
        found_agent=true
    fi
    
    if [[ -f "$WINDSURF_FILE" ]]; then
        update_agent_file "$WINDSURF_FILE" "Windsurf"
        found_agent=true
    fi
    
    if [[ -f "$KILOCODE_FILE" ]]; then
        update_agent_file "$KILOCODE_FILE" "Kilo Code"
        found_agent=true
    fi

    if [[ -f "$AUGGIE_FILE" ]]; then
        update_agent_file "$AUGGIE_FILE" "Auggie CLI"
        found_agent=true
    fi
    
    if [[ -f "$ROO_FILE" ]]; then
        update_agent_file "$ROO_FILE" "Roo Code"
        found_agent=true
    fi

    if [[ -f "$CODEBUDDY_FILE" ]]; then
        update_agent_file "$CODEBUDDY_FILE" "CodeBuddy CLI"
        found_agent=true
    fi

    if [[ -f "$Q_FILE" ]]; then
        update_agent_file "$Q_FILE" "Amazon Q Developer CLI"
        found_agent=true
    fi
    
    # If no agent files exist, create a default Claude file
    # エージェントファイルが存在しない場合、デフォルトのClaudeファイルを作成
    if [[ "$found_agent" == false ]]; then
        log_info "No existing agent files found, creating default Claude file..."
        # 既存のエージェントファイルが見つかりません、デフォルトのClaudeファイルを作成中...
        update_agent_file "$CLAUDE_FILE" "Claude Code"
    fi
}
print_summary() {
    echo
    log_info "Summary of changes:"
    # 変更の要約:
    
    if [[ -n "$NEW_LANG" ]]; then
        echo "  - Added language: $NEW_LANG"
        # - 言語を追加: $NEW_LANG
    fi
    
    if [[ -n "$NEW_FRAMEWORK" ]]; then
        echo "  - Added framework: $NEW_FRAMEWORK"
        # - フレームワークを追加: $NEW_FRAMEWORK
    fi
    
    if [[ -n "$NEW_DB" ]] && [[ "$NEW_DB" != "N/A" ]]; then
        echo "  - Added database: $NEW_DB"
        # - データベースを追加: $NEW_DB
    fi
    
    echo

    log_info "Usage: $0 [claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|codebuddy|q]"
    # 使用法: $0 [claude|gemini|copilot|cursor-agent|qwen|opencode|codex|windsurf|kilocode|auggie|codebuddy|q]
}

#==============================================================================
# Main Execution
# メイン実行
#==============================================================================

main() {
    # Validate environment before proceeding
    # 進行前に環境を検証
    validate_environment
    
    log_info "=== Updating agent context files for feature $CURRENT_BRANCH ==="
    # === 機能 $CURRENT_BRANCH のエージェントコンテキストファイルを更新中 ===
    
    # Parse the plan file to extract project information
    # プロジェクト情報を抽出するために計画ファイルを解析
    if ! parse_plan_data "$NEW_PLAN"; then
        log_error "Failed to parse plan data"
        # 計画データの解析に失敗
        exit 1
    fi
    
    # Process based on agent type argument
    # エージェントタイプ引数に基づいて処理
    local success=true
    
    if [[ -z "$AGENT_TYPE" ]]; then
        # No specific agent provided - update all existing agent files
        # 特定のエージェントが提供されていません - すべての既存エージェントファイルを更新
        log_info "No agent specified, updating all existing agent files..."
        # エージェントが指定されていません、すべての既存エージェントファイルを更新中...
        if ! update_all_existing_agents; then
            success=false
        fi
    else
        # Specific agent provided - update only that agent
        # 特定のエージェントが提供されました - そのエージェントのみを更新
        log_info "Updating specific agent: $AGENT_TYPE"
        # 特定エージェントを更新中: $AGENT_TYPE
        if ! update_specific_agent "$AGENT_TYPE"; then
            success=false
        fi
    fi
    
    # Print summary
    # 要約を印刷
    print_summary
    
    if [[ "$success" == true ]]; then
        log_success "Agent context update completed successfully"
        # エージェントコンテキストの更新が正常に完了しました
        exit 0
    else
        log_error "Agent context update completed with errors"
        # エージェントコンテキストの更新がエラーで完了しました
        exit 1
    fi
}

# Execute main function if script is run directly
# スクリプトが直接実行された場合にメイン関数を実行
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

