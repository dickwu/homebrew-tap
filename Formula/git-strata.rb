class GitStrata < Formula
  desc "Per-session APFS workspaces over shared git base snapshots"
  homepage "https://github.com/dickwu/git-strata"
  url "https://github.com/dickwu/git-strata.git",
      tag:      "v0.1.0",
      revision: "f369ad3f369ad3f369ad3f369ad3f369ad3f369a"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/dickwu/git-strata.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on macos: :ventura

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/git-strata")
    system "cargo", "install", *std_cargo_args(path: "crates/strata-daemon")
    pkgshare.install "examples/config.toml"
  end

  def caveats
    <<~EOS
      The daemon runs as the per-user LaunchAgent com.gwd.git-stratad.
      Do not use `brew services` for it: a second agent would contend for the
      same socket and lock. Write the plist once, pointing at the stable opt
      path (upgrades then need no plist edit):

        mkdir -p ~/Library/LaunchAgents
        git-stratad --print-plist #{opt_bin}/git-stratad > /tmp/git-stratad.plist &&
          mv /tmp/git-stratad.plist ~/Library/LaunchAgents/com.gwd.git-stratad.plist
        mkdir -p ~/Library/Application\\ Support/git-strata
        cp #{opt_pkgshare}/config.toml ~/Library/Application\\ Support/git-strata/
        # edit config.toml, then:
        git-strata daemon start

      Set [paths] root in config.toml to a directory on the same APFS volume
      as your repos (default ~/.strata).
      After `brew upgrade git-strata`: git-strata daemon stop && git-strata daemon start
      Before `brew uninstall git-strata`: git-strata daemon stop, then remove
      ~/Library/LaunchAgents/com.gwd.git-stratad.plist.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-strata --version")
    assert_match "git-stratad #{version}", shell_output("#{bin}/git-stratad --version")
    plist = shell_output("#{bin}/git-stratad --print-plist #{opt_bin}/git-stratad")
    assert_match "<string>com.gwd.git-stratad</string>", plist
    assert_match "<string>#{opt_bin}/git-stratad</string>", plist
  end
end
