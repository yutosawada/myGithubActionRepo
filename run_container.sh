#!/bin/bash
# run-container.sh
# このスクリプトは、ghcr.io/yutosawada/my-image を pull してコンテナを実行します

# エラー発生時にスクリプトを停止する
set -e

# 使用するイメージのタグを指定
IMAGE="ghcr.io/yutosawada/my-image:latest"

echo "Pulling image ${IMAGE} ..."
# docker pull ${IMAGE}

echo "Running container from ${IMAGE} ..."
# --rm オプションでコンテナ終了時に自動削除
docker run --rm ${IMAGE}
