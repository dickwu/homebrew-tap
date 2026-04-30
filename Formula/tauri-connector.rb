class TauriConnector < Formula
  desc "CLI for deep inspection and interaction with Tauri v2 desktop apps"
  homepage "https://github.com/dickwu/tauri-connector"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-apple-darwin.tar.gz"
      sha256 "021726468762542c2bdd3454cd2369e9c7a3f276217141c7f59ce9eb7f78f79d"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-apple-darwin.tar.gz"
      sha256 "918c0f7108135287d1cc3362888a55fa0b27ed36a0f16982e12fed598eb3bad9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "975475d4c8a2977ace67f2f38148559a8d2383e7c6494fe783f5f484117b99da"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff4e67c2b4be183c57be7da54c10405faf3cc871da565a1ddbcd1ec76d69d1c3"
    end
  end

  def install
    bin.install "tauri-connector"
    bin.install "tauri-connector-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tauri-connector --version")
  end
end
