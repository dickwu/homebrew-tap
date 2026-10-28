class TauriConnector < Formula
  desc "CLI for deep inspection and interaction with Tauri v2 desktop apps"
  homepage "https://github.com/dickwu/tauri-connector"
  version "0.17.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-apple-darwin.tar.gz"
      sha256 "23ac7420b60409a6d4ac97778c6eafcc01f17abc0f77ea6982b1fc5e9477d1b2"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-apple-darwin.tar.gz"
      sha256 "5e8100ba4cad26011e5354db6a35e6a9590a2980c62e2b30b127d3a5ffe795a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a200d95157efe02ffcc71f8046e7e4ed54248baef69855d94f609b4a9403c98"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dfeb3a79d9636fc2374ffa5379682b4dafb02adcfb068458308c7bc34747c4b"
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
