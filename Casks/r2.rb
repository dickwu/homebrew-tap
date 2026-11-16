cask "r2" do
  version "0.3.28"

  on_arm do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_aarch64.dmg"
    sha256 "339a799ebfd95595c1be71e2bd59cc0b4e9d846e99e91c1dad895371aaaa3552"
  end

  on_intel do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_x64.dmg"
    sha256 "eb50b5a306326734392e784158f12eb2d0913381c76f9aceb94ff0161707f0f1"
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
