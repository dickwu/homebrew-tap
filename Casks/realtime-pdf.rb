cask "realtime-pdf" do
  version "0.1.14"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.14_aarch64.dmg"
    sha256 "43a0ef1dde79fa34a5fda2ba5645e662710c66e04337927ea60697f69ccda527"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.14_x64.dmg"
    sha256 "d254b0279a5ad33b7177b4da43ceec2d5290c90a0d246b058f16e472dbaafc68"
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
      sudo xattr -d com.apple.quarantine /Applications/Realtime\ PDF.app/
  EOS

  zap trash: [
    "~/Library/Application Support/com.gwddeveloper.realtime-pdf",
    "~/Library/Caches/com.gwddeveloper.realtime-pdf",
    "~/Library/Preferences/com.gwddeveloper.realtime-pdf.plist",
    "~/Library/Saved Application State/com.gwddeveloper.realtime-pdf.savedState",
  ]
end
