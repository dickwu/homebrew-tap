cask "git-strata-desktop" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/dickwu/git-strata/releases/download/v#{version}/Git-Strata_#{version}_arm64.dmg"
  name "GIT STRATA"
  desc "Desktop app for git-strata sessions"
  homepage "https://github.com/dickwu/git-strata"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "dickwu/tap/git-strata"
  depends_on macos: :ventura

  app "GIT STRATA.app"

  zap trash: [
    "~/Library/Caches/io.github.dickwu.git-strata",
    "~/Library/Preferences/io.github.dickwu.git-strata.plist",
    "~/Library/Saved Application State/io.github.dickwu.git-strata.savedState",
    "~/Library/WebKit/io.github.dickwu.git-strata",
  ]

  caveats <<~EOS
    Release builds are signed with whatever identity the release workflow had
    (ad-hoc unless a Developer ID is configured) and may not be notarized. If
    macOS refuses the first open, allow it once in System Settings > Privacy &
    Security > Open Anyway.
    The app drives the daemon from the git-strata formula (LaunchAgent
    com.gwd.git-stratad); see `brew info dickwu/tap/git-strata`.
  EOS
end
