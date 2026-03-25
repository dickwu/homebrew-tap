class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.2.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "b1b322f0c80ef56c078bb9af65f401a456fa90f387f2b2a43cc222f0f7abdb5e"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "f846da5d1a1748b9106490d0c819258919c9f11a9c999e6e7f326ccc6fa3e769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "632530a902c2eec4575db24099e943c54c036dd074ede280b589e193e3677e75"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "29a7d89ebb9dbc987a0f16c12fafc8cdd1c00bf8b5afd3f7da8e9d8e20d46c0e"
    end
  end

  def install
    bin.install "ironguard"
    bin.install "ironguard-tui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ironguard --version")
  end
end