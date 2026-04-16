class SourceMapTauri < Formula
  desc "Static Tauri app scanner that emits Meilisearch-ready NDJSON"
  homepage "https://github.com/dickwu/source-map-tauri"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-aarch64-apple-darwin.tar.gz"
      sha256 "ecc69bcee7cc169e7585ddc9a89fabd6933c4b9b96a7747dd948aa770a53613a"
    end

    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-apple-darwin.tar.gz"
      sha256 "72382695b6d0c4c425c8df60564376cf3a52dd0540a293851f8ae5c66c14e35c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e6f47899e79e2dffc2b26b46fbbb277e2febc4b1286d620d81f3b572bff5bd2"
    end
  end

  def install
    bin.install "source-map-tauri"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/source-map-tauri --version")
  end
end
