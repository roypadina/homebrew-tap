class ClaudeJam < Formula
  desc "Share one real Claude Code session with other humans, over tmux and WebSockets"
  homepage "https://github.com/roypadina/claude-jam"
  url "https://github.com/roypadina/claude-jam/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "606e98ad4f6369bb0bf56ad2ae0f9348c007316e09dee8e32d62c25e4b1875b3"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--omit=dev", *std_npm_args(prefix: false)
    end
    # The launcher resolves its siblings from BASH_SOURCE, so bin/jam has to exec
    # the real script in libexec rather than symlink to it.
    (bin/"jam").write_env_script libexec/"jam", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  def caveats
    <<~EOS
      claude-jam drives your own Claude Code CLI, so `claude` has to be on PATH.
      A jam runs the host's real `claude` — their plugins, skills, MCP servers,
      CLAUDE.md, hooks and account. Everyone who joins is talking to that session.

      Optional extras:
        brew install ttyd         # --view, the read-only browser view
        brew install cloudflared  # --tunnel, for a guest off your LAN/tailnet

      The invite line the daemon prints starts with `node client.mjs …`, which is
      the from-source form. With this install, join with:
        jam join <ws-url> --name You [--token <token>]
    EOS
  end

  test do
    assert_match "jam host", shell_output("#{bin}/jam --help 2>&1", 2)
    assert_path_exists libexec/"node_modules/ws"
  end
end
