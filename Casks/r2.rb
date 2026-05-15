cask "r2" do
  version "0.2.8"

  on_arm do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_aarch64.dmg"
    sha256 "edf9f81591d031adef18b95762df4c70fa36acd5bd4a7ca34b89c558e1155e99"
  end

  on_intel do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_x64.dmg"
    sha256 "c325e5bfa3618ae778de26302afa3722662cf6ac38a80f9c868a1fd5d32c2b6a"
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
