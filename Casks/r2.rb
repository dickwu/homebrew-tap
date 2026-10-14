cask "r2" do
  version "0.3.11"

  on_arm do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_aarch64.dmg"
    sha256 "41e42e6ffe31e5ebfe753c20410fc50a9e08d7f83693435e380573e3e83f2580"
  end

  on_intel do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_x64.dmg"
    sha256 "603f085b8f00f5c36b6b61c64f9fb27009f7800fa53e0a5e09f223febbb927f3"
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
