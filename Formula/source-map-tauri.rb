class SourceMapTauri < Formula
  desc "Static Tauri app scanner that emits Meilisearch-ready NDJSON"
  homepage "https://github.com/dickwu/source-map-tauri"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-aarch64-apple-darwin.tar.gz"
      sha256 "e5adffba1bb25010b6c01e3d3dacf9b13c91d07b335af41c2c4c5a5fe8c93dd3"
    end

    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-apple-darwin.tar.gz"
      sha256 "83e330e23ca082143c7d93d529ff71f5c4b27427ed8e998a4f3867243020774b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2310194cd8ca04bc6e59eba7447d658710f37d00e6e99fbf6dfbf734b20fb55"
    end
  end

  def install
    bin.install "source-map-tauri"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/source-map-tauri --version")
  end
end
