class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.2.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "69fbef5d18ca61a95e8341d091cd2456524313d1bc7b3ef078d610d2da01c60c"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "15f0e3125649f7b53831c24555797bd30ddd02b9b0b1ab53e8420fe988344c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "bba1021fa7e07dc4d278cdb482b0bfb0a07a4e0173babeea0d6981820f0f5383"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "504abda541d3e2f87d90047e5ab15e6db04371b001790188543d14eb8e26f99b"
    end
  end

  def install
    bin.install "ironguard"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ironguard --version")
  end
end