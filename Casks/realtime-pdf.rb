cask "realtime-pdf" do
  version "0.1.1"

  on_arm do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v0.1.1/Realtime.PDF_0.1.1_aarch64.dmg"
    sha256 "0cc4f1df2cb0d7f9eb6c6900d78b6bf814f80e429f80aa80b24eccc91c9547d3"
  end

  on_intel do
    url "https://github.com/dickwu/realtime-pdf/releases/download/v0.1.1/Realtime.PDF_0.1.1_x64.dmg"
    sha256 "abb6d442d14eedeea1831a0d1ae3609777eeceaf9d567dd092a1c6849bb09f1a"
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
