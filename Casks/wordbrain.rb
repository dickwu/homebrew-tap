cask "wordbrain" do
  version "0.3.0"
  sha256 "3b21f2d25eb917fab33c3415c1d6fd3a07b1991b2d1c73598623531c94a4ed67"

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
