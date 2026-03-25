cask "piu" do
  version "0.1.41"

  on_arm do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_aarch64.dmg"
    sha256 "7a61ec5a540372bea8cb277534e2be67ae100c50ac351a4ed1367912aaee1c35"
  end
  on_intel do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_x64.dmg"
    sha256 "e7731afc2270848e115945a4772f577fc4cf2444cb92ff16697d424f2dbb22f4"
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
