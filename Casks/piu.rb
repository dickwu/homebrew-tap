cask "piu" do
  version "0.1.38"

  on_arm do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_aarch64.dmg"
    sha256 "c16ceeab6eca05aebca2361ba7f7db982a6d63af75b92c0ccc7700cedee24bd7"
  end
  on_intel do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_x64.dmg"
    sha256 "9e811784e532b5a9a1ddb7815b35cb2090d314c03e593bf076773e06927993be"
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
