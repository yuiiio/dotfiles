
sudo groupadd devgroup

sudo usermod -aG devgroup user1

sudo useradd -m -G wheel,devgroup -s /bin/bash user2
sudo passwd user2

# user1で開発、編集し、user2でsign, push のためのauthをssh-agentで行う
# フォルダをdevgroup所有に
sudo chgrp -R devgroup /work/project

# グループに読み書き権限を付与
sudo chmod -R g+rwX /work/project


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
