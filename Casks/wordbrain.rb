cask "wordbrain" do
  version "0.2.3"
  sha256 "80e9509c50d8148cec3d7e7f07389e18f1c6104b5a2ecd37ad3ed7dd28d0a7f5"

  url "https://github.com/dickwu/wordbrain/releases/download/v#{version}/WordBrain_#{version}_universal.dmg"
  name "WordBrain"
  desc "Local-first English vocabulary builder with FSRS review and word-network graphs"
  homepage "https://github.com/dickwu/wordbrain"

  app "WordBrain.app"

  zap trash: [
    "~/Library/Application Support/com.lifefarmer.wordbrain",
    "~/Library/Caches/com.lifefarmer.wordbrain",
    "~/Library/Preferences/com.lifefarmer.wordbrain.plist",
    "~/Library/Saved Application State/com.lifefarmer.wordbrain.savedState",
  ]
end
