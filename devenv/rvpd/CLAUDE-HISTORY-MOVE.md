  ```
  tar -C ~ --exclude='.claude/.credentials.json' -cf - .claude .claude.json \
                     | podman exec -i rvpd-dev tar -C /home/dev -xf -
  ```


パスをリネーム(必要なら)
  ```
  cp -a ~/.claude/projects ~/.claude/projects.bak
  grep -rl '/home/user1/rvpd' ~/.claude/projects/-srv-rvpd-work \
      | xargs -r sed -i 's#/home/user1/rvpd#/srv/rvpd/work#g'
  ```
  プロジェクトのパスは、ユーザー名を変えても影響を受けません。Claude Code は作業ディレクトリを実体のパスで記録するので、~/rvpd(/home/dev/rvpd → /srv/rvpd/work へのリンク)から起動しても、記録されるのは /srv/rvpd/work です
