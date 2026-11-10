class TauriConnector < Formula
  desc "CLI for deep inspection and interaction with Tauri v2 desktop apps"
  homepage "https://github.com/dickwu/tauri-connector"
  version "0.17.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-apple-darwin.tar.gz"
      sha256 "497c6835fdcdc00768f8c3842ef200278a1d94537ca3ea06af719e76326009e4"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-apple-darwin.tar.gz"
      sha256 "0780c19496ed5e6de997a401edfb7d15d4f2249fe87bcc3a47f732959bb060e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7f9fd66923d7c7aba393550cbdffb7d71b204810fe9c2720d66acf7205f8dfa"
    end

    on_intel do
      url "https://github.com/dickwu/tauri-connector/releases/download/v#{version}/tauri-connector-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2621291f84c445a3268820b37d48a99b0011cbd25ed64de3551b5620d993b53"
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
