#!/bin/bash
# エラーが発生するとスクリプトを終了する
set -e

# Remove a potentially pre-existing server.pid for Rails.
# railsのpidが存在している場合に削除す
rm -f /group_calendar/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# DockerfileのCMDで渡されたコマンド（→Railsのサーバー起動）を実行
exec "$@"