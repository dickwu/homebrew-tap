cask "piu" do
  version "0.1.36"

  on_arm do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_aarch64.dmg"
    sha256 "34a36609e4b41ed39af8e4ce2f3ce97cf2e299e8f00964d5bdca118ef17609ca"
  end
  on_intel do
    url "https://github.com/dickwu/piu/releases/download/v#{version}/Piu_#{version}_x64.dmg"
    sha256 "8faea72737d26916788913291bf9dfc956c224de976f44ecc1b56e158e08c844"
  end

  name "PIU"
  desc "Native desktop API client — Postman alternative built with Tauri"
  homepage "https://github.com/dickwu/piu"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Piu.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Piu.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Application Support/com.dickwu.piu",
    "~/Library/Caches/com.dickwu.piu",
    "~/Library/Preferences/com.dickwu.piu.plist",
    "~/Library/Saved Application State/com.dickwu.piu.savedState",
  ]
end
