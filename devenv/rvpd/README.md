
# 1. イメージを作る(Containerfile を読んでビルド。数分かかる)
podman build -t localhost/rvpd-dev \
  --build-arg USERNAME=dev \
  --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) .

# .はこのディレクトリにあるContainerfileを使うという意味

# 2. コンテナを作って入る(named volume rvpd-home もこのとき自動で作られる)
./run.sh

# 3. コンテナの中で、ツールをインストール(初回だけ)
setup-home
claude          # ログイン
