class SourceMapTauri < Formula
  desc "Static Tauri app scanner that emits Meilisearch-ready NDJSON"
  homepage "https://github.com/dickwu/source-map-tauri"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-aarch64-apple-darwin.tar.gz"
      sha256 "6833e7dde7cd63de6539e18918ec271a93bcfdf715d82380d2b8db730889da71"
    end

    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-apple-darwin.tar.gz"
      sha256 "e9d5b5a69d118ec6342fa6cd3123af34357653dc70f18cc61fb8cc84bf090612"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dickwu/source-map-tauri/releases/download/v#{version}/source-map-tauri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "364125534e8451a5541997d0f0a129b5ced8423736f1085527495f1beb33e584"
    end
  end

  def install
    bin.install "source-map-tauri"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/source-map-tauri --version")
  end
end
