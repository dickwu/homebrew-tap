class TauriConnector < Formula
  desc "CLI for deep inspection and interaction with Tauri v2 desktop apps"
  homepage "https://github.com/dickwu/tauri-connector"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-apple-darwin.tar.gz"
      sha256 "ade188c3f9cf890d96cb76181e3a6d71e3bea3e78e957acabbb94c9736fd34c0"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-apple-darwin.tar.gz"
      sha256 "0670b19215f5c5be44c3fc02a4148da4adab271e3db2fbb315b0bdf9c51bfb6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34d5dcb31645e8f7e352e9ab533da4f91c8a3aace18d03afcbde27dd4ba3f3b6"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34dc2eb127f44536bc44209845f504d9fdced79f22b616e69f60cd28be49e8a0"
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
