cask "piu" do
  version "0.1.45"

  on_arm do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_aarch64.dmg"
    sha256 "9271286607be015314f98d3a81c4934d1681322126df85c29376533b844e25b2"
  end
  on_intel do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_x64.dmg"
    sha256 "768eccbd3f258789d7cb13895c38a2015ace344ceed89cd6593111f3c0e298ab"
  end

  name "PIU"
  desc "Native desktop API client — Postman alternative built with Tauri"
  homepage "https://github.com/dickwu/piu"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Piu.app"

  caveats <<~EOS
    If macOS shows a "damaged app" or quarantine warning, run:
      sudo xattr -d com.apple.quarantine /Applications/Piu.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.dickwu.piu",
    "~/Library/Caches/com.dickwu.piu",
    "~/Library/Preferences/com.dickwu.piu.plist",
    "~/Library/Saved Application State/com.dickwu.piu.savedState",
  ]
end
