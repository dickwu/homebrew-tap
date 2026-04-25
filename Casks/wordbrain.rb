cask "wordbrain" do
  version "0.1.7"
  sha256 "2030c6d975e21b09fd68182cecd00b0684c816afadc740bba3eb3a0e0ba7dcf9"

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
