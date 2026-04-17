class SourceMapTauri < Formula
  desc "Static Tauri app scanner that emits Meilisearch-ready NDJSON"
  homepage "https://github.com/dickwu/source-map-tauri"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-aarch64-apple-darwin.tar.gz"
      sha256 "12ff92c98920b203cd67937b18c39c0cf9a816ef87d152fe05112acf25622e65"
    end

    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-apple-darwin.tar.gz"
      sha256 "675a40fc911d81cd2e22d085685a076b46f4aad77d7af03bb1f6ca38cf00e6f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f88befa5f295968dffbb05997ee09ff93000ff719efdedba78f9275a3483e1f"
    end
  end

  def install
    bin.install "source-map-tauri"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/source-map-tauri --version")
  end
end
