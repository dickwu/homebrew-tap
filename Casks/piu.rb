cask "piu" do
  version "0.1.40"

  on_arm do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_aarch64.dmg"
    sha256 "2f9c53097c6f0adbc6359e97d8d7affa9c263cb3903603760bb6adeaf81487f0"
  end
  on_intel do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_x64.dmg"
    sha256 "572db1a59deb304edb2e3328692bffaad9fdb3ae02ed3f010ead20073370876c"
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
