cask "r2" do
  version "0.2.23"

  on_arm do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_aarch64.dmg"
    sha256 "5b7be4b59a7355cf242985e51c25b20c0c32b07e325d5baa10720b635b9cceda"
  end

  on_intel do
    url "https://github.com/dickwu/r2/releases/download/v#{version}/r2_#{version}_x64.dmg"
    sha256 "ea35b3540129c28b7dd1425abaff9ee00158d530ebae642100a04a37510bf417"
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
