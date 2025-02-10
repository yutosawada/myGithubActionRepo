#!/bin/bash
# commit.sh - 引数で渡されたコミットメッセージを使って Git コミットを実行し、
#              コミットが成功した場合に PUSH を実行するスクリプト

# 引数が渡されていない場合はエラーメッセージを表示して終了
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 \"コミットメッセージ\""
    exit 1
fi

# 全ての引数を1つの文字列として扱う
COMMIT_MSG="$*"

echo "コミットメッセージ: ${COMMIT_MSG}"

# 変更があるファイルをすべてステージング
git add .

# コミットを実行し、成功した場合に PUSH を行う
if git commit -m "${COMMIT_MSG}"; then
    echo "コミットに成功しました。PUSH を実行します。"
    if git push; then
        echo "PUSH に成功しました。"
    else
        echo "PUSH に失敗しました。"
        exit 1
    fi
else
    echo "コミットに失敗しました。PUSH をスキップします。"
    exit 1
fi
