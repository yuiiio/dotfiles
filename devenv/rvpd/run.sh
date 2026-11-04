#!/usr/bin/env bash
# ホストの user1 で実行する。コンテナがなければ作成し、あれば起動してシェルに入る
# マウントやオプションを変えたときは、podman rm -f rvpd-dev で作り直す
set -euo pipefail
 
NAME=rvpd-dev
IMAGE=localhost/rvpd-dev:latest
WORK=/srv/rvpd/work   # user1 の作業リポジトリ(読み書き)
PUSH=/srv/rvpd/push   # user2 のリポジトリ(読み取り専用、git fetch origin 用)
CHOME=/home/dev       # コンテナ内のホーム(Containerfile の USERNAME に合わせる)

DEVENV=$(cd "$(dirname "$0")" && pwd)   # このスクリプトのあるディレクトリ
 
if ! podman container exists "$NAME"; then
  # 渡さないもの: Wayland / X11 / D-Bus / podman.sock / ssh-agent / PipeWire
  # ホストの PostgreSQL を使う場合: --network pasta:-T,5432 を追加
  podman run -d --name "$NAME" --hostname "$NAME" \
    --init \
    --userns=keep-id \
    --cap-drop=all \
    --security-opt=no-new-privileges \
    --pids-limit=4096 \
    --network pasta:-T,5432 \
    -p 127.0.0.1:5173:5173 \
    -p 127.0.0.1:5000:5000 \
    -v "rvpd-home:$CHOME" \
    -v "$HOME/.config/nvim:$CHOME/.config/nvim:ro" \
    -v "$DEVENV:/devenv:ro" \
    -v "$HOME/share-rvpd-read-only-for-container:$CHOME/share-rvpd-doc:ro" \
    -e ZDOTDIR=/devenv/zsh \
    -v "$WORK:$WORK" \
    -v "$PUSH:$PUSH:ro" \
    -w "$WORK" \
    "$IMAGE"
fi

# ホストのターミナルの定義(terminfo)をコンテナに渡す
# Rocky 9 の ncurses は古く、foot / kitty / ghostty などの定義がないため、
# バックスペースなどが正しく動かない。ホストの定義を /devenv/terminfo に書き出す
CTERM=${TERM:-xterm-256color}
if TMPTI=$(mktemp) && infocmp -x "$CTERM" > "$TMPTI" 2>/dev/null \
   && mkdir -p "$DEVENV/terminfo" && tic -x -o "$DEVENV/terminfo" "$TMPTI" 2>/dev/null; then
  :
else
  CTERM=xterm-256color   # 書き出せなければ、どこにでもある定義に切り替える
fi
rm -f "$TMPTI"
 
podman start "$NAME" >/dev/null
exec podman exec -it \
  -e TERM="$CTERM" -e COLORTERM="${COLORTERM:-}" \
  -e TERMINFO_DIRS=/devenv/terminfo:/usr/share/terminfo \
  -e ZDOTDIR=/devenv/zsh \
  -w "$WORK" "$NAME" zsh -l
