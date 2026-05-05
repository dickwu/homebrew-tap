cask "realtime-pdf" do
  version "0.1.13"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.13_aarch64.dmg"
    sha256 "01c7a511583f4ce278139e91c9e7b182175bef1235b9382d988b847c5b4dee45"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v#{version}/Realtime.PDF_0.1.13_x64.dmg"
    sha256 "821d39b754721da0d3b8b273d4b46138f17ba62c9b281cf7326baefe865a14b2"
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
