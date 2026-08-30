class ClaudeJam < Formula
  desc "Share one real Claude Code session with other humans, over tmux and WebSockets"
  homepage "https://github.com/roypadina/claude-jam"
  url "https://github.com/roypadina/claude-jam/archive/refs/tags/v0.23.5.tar.gz"
  sha256 "c18d16a270ebe7a3d1cc257313e78c269346458a7fb84df02fe21f30a464ad92"
  license "MIT"

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--omit=dev", *std_npm_args(prefix: false)
    end
    # The launcher resolves its siblings from BASH_SOURCE, so bin/claude-jam and bin/jam have to
    # exec the real script in libexec rather than symlink to it. jam is a deprecated alias for
    # claude-jam and both wrappers point at the same libexec target.
    (bin/"claude-jam").write_env_script libexec/"claude-jam", PATH: "#{formula_opt_bin("node")}:$PATH"
    (bin/"jam").write_env_script libexec/"claude-jam", PATH: "#{formula_opt_bin("node")}:$PATH"
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
        claude-jam join <ws-url> --name You [--token <token>]
    EOS
  end

  test do
    assert_match "claude-jam host", shell_output("#{bin}/claude-jam --help 2>&1")
    assert_match "claude-jam host", shell_output("#{bin}/jam --help 2>&1")
    assert_path_exists libexec/"node_modules/ws"
  end
end
