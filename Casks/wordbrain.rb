cask "wordbrain" do
  version "0.1.11"
  sha256 "b6e0cef7c10cce952090d491398334f8fe8450af1e165d4a12a46d9a95cb396d"

  url "https://github.com/dickwu/wordbrain/releases/download/v#{version}/WordBrain_#{version}_universal.dmg"
  name "WordBrain"
  desc "Local-first English vocabulary builder with FSRS review and word-network graphs"
  homepage "https://github.com/dickwu/wordbrain"
  license "MIT"

  app "WordBrain.app"

  zap trash: [
    "~/Library/Application Support/com.lifefarmer.wordbrain",
    "~/Library/Caches/com.lifefarmer.wordbrain",
    "~/Library/Preferences/com.lifefarmer.wordbrain.plist",
    "~/Library/Saved Application State/com.lifefarmer.wordbrain.savedState",
  ]
end
