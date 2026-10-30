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
    GIT STRATA is signed with a self-signed identity and is not notarized, so
    Gatekeeper blocks the first open. Open it once, then allow it in
    System Settings > Privacy & Security > Open Anyway.
    The app drives the daemon from the git-strata formula (LaunchAgent
    com.gwd.git-stratad); see `brew info git-strata`.
  EOS
end
