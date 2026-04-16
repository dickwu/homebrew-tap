cask "realtime-pdf" do
  version "0.1.2"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.2_aarch64.dmg"
    sha256 "e7f295259efa2f9efdf50ac8ac0e1faf3437a88486cfef482f8e9645613e48a3"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.2_x64.dmg"
    sha256 "c9dfeea1996035d78efeb9d2ba36a5e1749bcb65dc40d93612e0a4221446e952"
  end

  name "Realtime PDF"
  desc "Desktop PDF watcher with saved history and regeneration hooks"
  homepage "https://github.com/dickwu/realtime-pdf"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Realtime PDF.app"

  caveats <<~EOS
    If macOS shows a "damaged app" or quarantine warning, run:
      sudo xattr -rd com.apple.quarantine "/Applications/Realtime PDF.app"
  EOS

  zap trash: [
    "~/Library/Application Support/com.gwddeveloper.realtime-pdf",
    "~/Library/Caches/com.gwddeveloper.realtime-pdf",
    "~/Library/Preferences/com.gwddeveloper.realtime-pdf.plist",
    "~/Library/Saved Application State/com.gwddeveloper.realtime-pdf.savedState",
  ]
end
