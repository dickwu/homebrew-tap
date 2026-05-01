cask "ai-web-debugger" do
  version "0.1.1"
  sha256 "8109f635922c03421b30d0d6548eed28b7ec3cef2bf1f793cbaaa34480605c9c"

  url "https://github.com/dickwu/ai-web-debugger/releases/download/v#{version}/AI-Web-Debugger-#{version}-arm64.dmg"
  name "AI Web Debugger"
  desc "Observable Electron browser for LLM-driven webpage debugging"
  homepage "https://github.com/dickwu/ai-web-debugger"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "AI Web Debugger.app"

  zap trash: [
    "~/Library/Application Support/ai-web-debugger",
    "~/Library/Caches/ai-web-debugger",
    "~/Library/Preferences/com.aiwebdebugger.desktop.plist",
    "~/Library/Saved Application State/com.aiwebdebugger.desktop.savedState",
  ]

  caveats <<~EOS
    If macOS shows a "damaged app" or quarantine warning, run:
      sudo xattr -d com.apple.quarantine /Applications/AI\\ Web\\ Debugger.app/
  EOS
end
