cask "wordbrain" do
  version "0.2.4"
  sha256 "4668914238a8be95575e931a5cde5733b22facf702e3cfde27c64aa5da9ae04a"

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
