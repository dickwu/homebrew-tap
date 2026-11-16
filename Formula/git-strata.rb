class GitStrata < Formula
  desc "Per-session APFS workspaces over shared git base snapshots"
  homepage "https://github.com/dickwu/git-strata"
  url "https://github.com/dickwu/git-strata/releases/download/v0.2.3/git-strata-0.2.3-aarch64-apple-darwin.tar.gz"
  sha256 "7c6398a8648081412bce8135dd2b2fd7be2a75e5cc7b95c5633ac037ec3f4c37"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "bin/git-strata", "bin/git-stratad"
    pkgshare.install "share/git-strata/config.toml"
  end

  # No `service do` block on purpose: `brew services` would load a second
  # LaunchAgent (homebrew.mxcl.git-strata) next to com.gwd.git-stratad, and two
  # daemons would contend for the same socket and lock.
  def caveats
    <<~EOS
      The daemon runs as the per-user LaunchAgent com.gwd.git-stratad.
      Do not use `brew services` for it. Write the plist once, pointing at the
      stable opt path (upgrades then need no plist edit):

        mkdir -p ~/Library/LaunchAgents
        t=$(mktemp ~/Library/LaunchAgents/.git-stratad.XXXXXX) &&
          git-stratad --print-plist #{opt_bin}/git-stratad > "$t" &&
          mv "$t" ~/Library/LaunchAgents/com.gwd.git-stratad.plist
        mkdir -p ~/Library/Application\\ Support/git-strata
        cp #{opt_pkgshare}/config.toml ~/Library/Application\\ Support/git-strata/
        # edit config.toml, then:
        git-strata daemon start

      Set [paths] root in config.toml to a directory on the same APFS volume
      as your repos (default ~/.strata).
      After `brew upgrade git-strata`, restart the agent in place:
        launchctl kickstart -k gui/$(id -u)/com.gwd.git-stratad
      then check `git-strata daemon status` and run
        npx skills update git-strata -g
      Before `brew uninstall git-strata`: run git-strata daemon stop. Only after
      it succeeds, remove ~/Library/LaunchAgents/com.gwd.git-stratad.plist,
      then uninstall. If stop fails or times out, do not continue.
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
