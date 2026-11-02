
sudo groupadd devgroup

sudo usermod -aG devgroup user1

sudo useradd -m -G wheel,devgroup -s /bin/bash user2
sudo passwd user2

# user1で開発、編集し、user2でsign, push のためのauthをssh-agentで行う
# user2(credential)側のツリーはuser2のみ(chmod 700)

# .git/configフォルダなどに攻撃用のスクリプトが仕込まれる可能性があるため
# user1とuser2で完全に別のツリーを持ち、.gitフォルダ以外を都度確認しながらuser2から取り込む
# .github/workflows/, package.json の scripts、.npmrc、pnpm-lock.yaml: レジストリや解決先の URL、integrity の変更に注意

# コンテナ内user1で(user-2の変更)の取り込みは、読み込みのみのbare-repo(to-user1)を通す
# user2での取り込みは、読み込みのみのbare-repo(to-user2)からfetchする
# user2でto-user2, user1では両方(to-user1/to-user2)でのgit操作を禁止する(bare-repoのfetchのみ)

# お互いの書き込みのみできるフォルダと、読み込みのみできるフォルダを別々に持たせる

# 2750 の2 は SGID (Set Group ID) 文字にすると(rwxr-s---)sは実行権限(x)もあり、Sは実行権限がない場合
# 4 (読み取り: r) + 2 (書き込み: w) + 1 (実行: x)
# ディレクトリに設定した場合： そのディレクトリ内に新しく作成されたファイルやフォルダは、作成したユーザーの主グループに関わらず、自動的にこのディレクトリと同じグループ所有権を引き継ぎます
# • ファイル（実行バイナリ）に設定した場合： どのユーザーが実行しても、そのファイルの「所有グループ」の権限で実行されます

# 受け渡し箱(git-bare-repository with separated single-direction read/write permission)
# /srv/dev-exchange/
# ├── to-user2/    user1 所有、devgroup、2750  ← コンテナがパッチを書き出す。user2 は読むだけ
# └── to-user1/    user2 所有、755            ← user2 が bundle を置く。user1 は読むだけ

```
sudo install -d -o user1 -g devgroup -m 2750 /srv/rvpd-exchange/to-user2.git
sudo install -d -o user2 -g user2    -m 0755 /srv/rvpd-exchange/to-user1.git # コードはこのPC内のユーザーからは機密でないので、コンテナから補助グループなしで参照可能にしておく
```

## コンテナへのマウント方法
```
-v /home/user1/work/rvpd:/home/user1/work/rvpd \
-v /srv/rvpd-exchange/to-user2:/srv/exchange/to-user2 \
-v /srv/rvpd-exchange/to-user1:/srv/exchange/to-user1:ro
```

# user2
```
git init --bare /srv/rvpd-exchange/to-user1.git
cd ~/repo/rvpd
git remote add exchange file:///srv/rvpd-exchange/to-user1.git   # push 用
git remote add worker   file:///srv/rvpd-exchange/to-user2.git   # fetch 用
git push exchange main
```

# user1(コンテナ内)
```
git init --bare /srv/rvpd-exchange/to-user2.git
git remote set-url origin file:///srv/rvpd-exchange/to-user1.git  # fetch 用
git remote add outbox     file:///srv/rvpd-exchange/to-user2.git  # push 用
```

# user2: upstream の更新を渡す(exchange=to-user1)
```
git pull && git push exchange main
```

# コンテナ内: 取り込み、作業して渡す(outbox=to-user2)
```
git fetch origin && git rebase origin/main
git push outbox HEAD:refs/heads/feature-x
```

# user2: 受け取ってレビュー
```
git fetch worker
git log -p main..worker/feature-x
git merge --ff-only worker/feature-x   # または cherry-pick
git push
```

## user1(コンテナの外)ではgitコマンドを使わない(コンテナからの危険な変更が含まれているため)
## 同様に、user2はto-user2内でgitコマンドを使用禁止にする(to-user2をfetchするだけ)


## password-encもuser2以下に保存(chmod 700)
# drwx------ 2 passkey devgroup
# │││   │││
# │││   ││└─ その他ユーザー: 権限なし
# │││   └── グループ: 権限なし
# │└────── 所有者: 読み書き・通過可能
# drwx------ 2 passkey devgroup 4.0K Oct 30 23:29 password
# drwx------ 2 passkey devgroup 4.0K Oct 30 23:29 password-enc

## wayland compositor はuser1で動くので、ssh-agent -cが使えない

```
echo "UID=$(id -u)"
echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
echo "SSH_AGENT_PID=$SSH_AGENT_PID"

stat -c '%A %a %U:%G %n' "$SSH_AUTH_SOCK"
stat -c '%A %a %U:%G %n' "$(dirname "$SSH_AUTH_SOCK")"

UID=1001
SSH_AUTH_SOCK=/home/passkey/.ssh/agent/s...
SSH_AGENT_PID=580679
srw------- 600 passkey:passkey /home/passkey/.ssh/agent/s..
drwx------ 700 passkey:devgroup /home/passkey/.ssh/agent
```
ssh_agent sockが600, 親ディレクトリが700であることを確認
/home/user2も700である必要
suodersでwheelグループにsudoを許すのをやめ、user2のみに許可する
