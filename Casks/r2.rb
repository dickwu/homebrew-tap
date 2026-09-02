cask "r2" do
  version "0.3.3"

  on_arm do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_aarch64.dmg"
    sha256 "e1e745b2c363746420dcd1030ec011662f0120525cfcd7c8b4ff42a288281adc"
  end

  on_intel do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_x64.dmg"
    sha256 "6131eb465a39cfe490b3fbadfd4af1d24cb36949ac952c72ebeaaeda6a130c7b"
  end

  name "R2 Client"
  desc "Desktop client for managing S3-compatible storage (Cloudflare R2, AWS S3, MinIO, RustFS)"
  homepage "https://github.com/dickwu/r2"

  app "r2.app"

  zap trash: [
    "~/Library/Application Support/com.lifefarmer.r2",
    "~/Library/Caches/com.lifefarmer.r2",
    "~/Library/Preferences/com.lifefarmer.r2.plist",
    "~/Library/Saved Application State/com.lifefarmer.r2.savedState",
  ]
end
