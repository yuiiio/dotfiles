#!/usr/bin/env bash
# コンテナ内で /devenv/setup-home.sh として実行する(何度実行しても問題ない)
# ホストの ~/devenv/rvpd/ が読み取り専用でマウントされているので、
# ホストで編集すれば、イメージを作り直さずに次の実行から反映される
# インストール先はホームの named volume なので、イメージを作り直しても残る
set -euo pipefail
 
# pnpm 11 以降、グローバルのコマンドは $PNPM_HOME/bin に入る
export PATH="$PNPM_HOME/bin:$PATH"
 
# --- 待機期間(公開から7日未満のバージョンは入れない) ---
# mise: ツール本体(node, pnpm, neovim など)。設定してからインストールする
mise settings set minimum_release_age 7d
 
# npm: 直接は使わないが、何かが内部で呼んだ場合の保険(npm v11.10 以上で有効)
cat > ~/.npmrc << 'NPMRC'
min-release-age=7
ignore-scripts=true
NPMRC
 
# --- ツールのインストール ---
# プロジェクトの .node-version を mise に読ませる
mise settings add idiomatic_version_file_enable_tools node
 
# 既定のツール(プロジェクト側の .node-version があればそちらが優先される)
mise use -g node@lts pnpm@11 neovim@latest tree-sitter@latest starship@latest
mise reshim
 
# pnpm: 単位は分(10080 = 7日)。ユーザー全体の設定
pnpm config set minimumReleaseAge 10080 --location=user
# 更新通知を出さない(pnpm 本体の更新は mise で行う。pnpm self-update は使わない)
pnpm config set updateNotifier false --location=user
 
# LSP(mason.nvim で管理する場合はこの行は不要)
pnpm add -g typescript typescript-language-server vscode-langservers-extracted
 
# OmniSharp(C# LSP)。GitHub リリースから直接入れるので、公開日を自分で確認する
# バージョンはタグで指定する。"latest" は正式版の最新(ベータ版は含まれない)
# 別のバージョンにするには: OMNISHARP_TAG=v1.39.14 /devenv/setup-home.sh
OMNISHARP_TAG=${OMNISHARP_TAG:-v2.0.0}
 
install_omnisharp() {
  local dest=~/.local/opt/omnisharp
  local api=https://api.github.com/repos/OmniSharp/omnisharp-roslyn/releases
  local rel tag published name url tmp
  if [[ $OMNISHARP_TAG == latest ]]; then
    rel=$(curl -fsSL "$api/latest")
  else
    rel=$(curl -fsSL "$api/tags/$OMNISHARP_TAG")
  fi
  tag=$(jq -r .tag_name <<<"$rel")
  published=$(jq -r .published_at <<<"$rel")
 
  if [[ -f $dest/.version && $(<"$dest/.version") == "$tag" ]]; then
    echo "OmniSharp $tag はインストール済み"
    return
  fi
  if (( $(date -d "$published" +%s) > $(date -d '7 days ago' +%s) )); then
    echo "OmniSharp $tag は公開から7日未満($published)のためスキップ"
    return
  fi
 
  # Linux x64 版を探す。名前は omnisharp-linux-x64.tar.gz や
  # omnisharp-linux-x64-net6.0.tar.gz など。.NET 版、tar.gz の順に優先する
  read -r name url < <(jq -r '
      [.assets[] | select(.name | test("^omnisharp-linux-x64(-net[0-9.]+)?\\.(tar\\.gz|zip)$"))]
      | sort_by([(.name | test("-net") | not), (.name | endswith(".zip"))]) | first // empty
      | "\(.name) \(.browser_download_url)"' <<<"$rel") || true
  if [[ -z ${url:-} ]]; then
    echo "OmniSharp $tag に Linux x64 版が見つかりません。ファイル一覧:" >&2
    jq -r '.assets[].name' <<<"$rel" >&2
    return 1
  fi
 
  tmp=$(mktemp -d)
  curl -fsSL "$url" -o "$tmp/$name"
  rm -rf "$dest" && mkdir -p "$dest"
  case $name in
    *.tar.gz) tar -xzf "$tmp/$name" -C "$dest" ;;
    *.zip)    unzip -q "$tmp/$name" -d "$dest" ;;
  esac
  rm -rf "$tmp"
  chmod +x "$dest/OmniSharp"
  echo "$tag" > "$dest/.version"
  echo "OmniSharp $tag をインストールしました($name、$published 公開)"
}
install_omnisharp

# プロジェクトの .node-version などで指定されたバージョンも入れておく
if [[ -d /srv/rvpd/work ]]; then
  (cd /srv/rvpd/work && mise install)
fi
 
# Claude Code(ネイティブインストーラ、stable チャネル = 約1週間前の版)
if ! command -v claude >/dev/null 2>&1; then
  curl -fsSL https://claude.ai/install.sh | bash -s stable
fi
 
# --- git ---
# コンテナ内の git: ローカルコミット用。署名はしない(鍵がないため)
git config --global commit.gpgsign false
git config --global init.defaultBranch main
 
echo
echo "残りの手作業:"
echo "  1. git config --global user.name / user.email を設定"
echo "  2. ~/.claude/settings.json に \"autoUpdatesChannel\": \"stable\" を追加"

