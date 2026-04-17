cask "realtime-pdf" do
  version "0.1.7"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.7_aarch64.dmg"
    sha256 "073d0c28f6f63bab1542b175d36381b9d9a9ae26bd362c8717f5ca3b66f53a33"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.7_x64.dmg"
    sha256 "da3993a19277be0298627d0d91a6986e7db9d3e61ff3bf6d913ea5e044f6a6a9"
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
