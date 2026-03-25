class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "c0fb6d96aeebee5b732548f1590811deccf00c75d1f40518c404f2a6fe6ff9eb"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "f1fd3670a6734f27d6df2c97a768b4b7070fe1305a2bcfb37a9c92610ce78b81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "eba2710295a463ca7de63d1e4097b1e37453c9c110ef6ac69fb000f0bf2fd806"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "88e32dda5eb56389863d907a1d3d1468f9a4e42aff21de38effc5da0561460db"
    end
  end

  def install
    bin.install "ironguard"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ironguard --version")
  end
end
