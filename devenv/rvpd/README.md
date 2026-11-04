
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

# ホストのpostgresqlにTCPで接続(im,applicommonを許可)
# /var/lib/postgres/data/pg_hba.conf
```

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# Unix ソケット: OS のユーザー名と同じ名前のロールでのみ接続可(コンテナからは届かない(TCPなため))
local   all             all                                     peer
local   replication     all                                     peer

# TCP(コンテナから pasta 経由で届く経路): im と applicommon を、im のデータベースにだけ許可
host    inventorymngdb_development,commondb_inventorymng,"rvpd-test","nagakusa-oracle",mydb,"2025128115844-commondb"  im,applicommon  127.0.0.1/32  trust
host    inventorymngdb_development,commondb_inventorymng,"rvpd-test","nagakusa-oracle",mydb,"2025128115844-commondb"  im,applicommon  ::1/128  trust


# それ以外の TCP はすべて拒否(superuser を含む)
host    all             all             127.0.0.1/32            reject
host    all             all             ::1/128                 reject
host    replication     all             127.0.0.1/32            reject
host    replication     all             ::1/128                 reject

```

  - conf/appsettings.Test.json は Username=postgres で inventorymngdb_test
    に接続します。新しい pg_hba.conf では DB もユーザーも許可していないため、DB
    を使うテストは dotnet test で失敗するはずです。テストも動かすなら、inventorymngdb_test
    を許可に足して、ユーザーを im にするなどの対応が要ります。
