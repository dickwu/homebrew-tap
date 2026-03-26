class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "404796992c5bde796ffc567cb7c965b28b7575d2452669a372c005c6140de13c"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "b255b3aec957d9135f14199ce056d3afa467fa6dae98f2099f34f6973e28c701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "8e70d35fca89f79b325c92b80212f9feb127fa02c46968fcf620f5c147ad277d"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "7195464e4d6b3ea841ec7796cb7c7d72a3a79a5e1859b72b11fff3859b0a9fb3"
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