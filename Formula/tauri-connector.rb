class TauriConnector < Formula
  desc "CLI for deep inspection and interaction with Tauri v2 desktop apps"
  homepage "https://github.com/dickwu/tauri-connector"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-apple-darwin.tar.gz"
      sha256 "752f3cbe4082169915dc775f375e810cb2e13ae658bd55e8da4cb6964322611f"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-apple-darwin.tar.gz"
      sha256 "70deece6300709c3812c0734ef446f4d7701fb8efd7d72a8244af5250536cb8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93d2b39a6c01634acdb3b8001faf67989fe8f6e6ca99987e84be80a0cb1465d3"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6aa33db7ffaf463d49ad20fd6d46786da496bc8d89c76b92ebfb935cf44bf846"
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
