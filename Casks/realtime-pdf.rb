cask "realtime-pdf" do
  version "0.1.9"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.9_aarch64.dmg"
    sha256 "81918fd4332f4e65ab7feeb9b38ad10b65acdeff81bf0d6fbd8060a0d6a68938"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.9_x64.dmg"
    sha256 "70d68560d861cbce12f06f9c9d7aa8b016fb2b598bfe156e035edcbc3ef9ed48"
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
