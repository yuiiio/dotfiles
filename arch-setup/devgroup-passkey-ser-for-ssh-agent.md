
sudo groupadd devgroup

sudo usermod -aG devgroup user1

sudo useradd -m -G wheel,devgroup -s /bin/bash user2
sudo passwd user2

# user1で開発、編集し、user2でsign, push のためのauthをssh-agentで行う
# user2(credential)側のツリーはuser2のみ(chmod 700)

# .git/configフォルダなどに攻撃用のスクリプトが仕込まれる可能性があるため
# user1とuser2で完全に別のツリーを持ち、.gitフォルダ以外を都度確認しながらuser2から取り込む
# .github/workflows/, package.json の scripts、.npmrc、pnpm-lock.yaml: レジストリや解決先の URL、integrity の変更に注意

# コンテナ内user1で(user-2の変更)の取り込みは、push-dir(読み込みのみ権限)からfetch
# user2での取り込みは、work-dir(読み込みのみ権限)からfetchする
# user2, user1でのwork-dirのgit操作を禁止する(fetch はコンテナ内から)

# お互いの書き込みのみできるフォルダと、読み込みのみできるフォルダを別々に持たせる

# 2750 の2 は SGID (Set Group ID) 文字にすると(rwxr-s---)sは実行権限(x)もあり、Sは実行権限がない場合
# 4 (読み取り: r) + 2 (書き込み: w) + 1 (実行: x)
# ディレクトリに設定した場合： そのディレクトリ内に新しく作成されたファイルやフォルダは、作成したユーザーの主グループに関わらず、自動的にこのディレクトリと同じグループ所有権を引き継ぎます
# • ファイル（実行バイナリ）に設定した場合： どのユーザーが実行しても、そのファイルの「所有グループ」の権限で実行されます

# 受け渡し箱
# /srv/dev-exchange/
# ├── work/    user1 所有、devgroup、2750  ← コンテナが書き込む。user2 は読むだけ
# └── push/    user2 所有、755            ← user2が書き込む。user1(コンテナ) は読むだけ

```
sudo install -d -o user2 -g user2 -m 0750 /srv/rvpd/push # コードはこのPC内のユーザーからは機密でないので、コンテナから補助グループなしで参照可能にしておく

sudo install -d -o user1 -g devgroup -m 2750 /srv/rvpd/work # グループに読み取りを許可、ディレクトリ内新規ファイルは権限を引き継ぐ
```
# user2で/srv/dev-exchange/pushにリポジトリの中身をコピー
```
cp -a /path/from-git/. /srv/rvpd/push/
```
## user1でpushからworkにクローン(originはpushを指す)
```
git clone file:///srv/rvpd/push /srv/rvpd/work
```

## コンテナへのマウント方法
```
-v /srv/rvpd/work:/srv/rvpd/work \
-v /srv/rvpd/push:/srv/rvpd/push:ro
```

# user2
```
git remote add work file:///srv/rvpd/work
```
## user1,user2ともに
## コンテナの外ではworkフォルダでgitコマンドを使わない(コンテナからの危険な変更が含まれているため)
## コンテナ内でfetch
```
work-dirでpushをfetchする場合は、決してuser2,user1でwork-dirでgitコマンドを使用しない
```

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
