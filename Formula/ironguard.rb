class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "865b329bf24e7993aae95f670a99b512772de8cc13317e81a484fd8b576f3012"
    else
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "a9107b79189e10817256c71af8685df234c9940eb6454e90c60d72257a86c0a3"
    end
  end

  def install
    bin.install "ironguard"
  end

  test do
    assert_match "Modern cross-platform WireGuard", shell_output("#{bin}/ironguard --help")
  end
end
