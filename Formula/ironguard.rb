class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "e343fe2c323f74d8e5ed56041a0cf7674bc88608d29fe62456c391f93bebce21"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "37d79b55014093cb348dfe96bbf56ffa6f7f6e73607667ea8b567ad4052ad392"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "9901c2df118792cf677cb82e67711f2a2bc0f50d61edc49b776801606c2088cf"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "6e417b93f5aa49542d894d482a956fc8a61302733d22d19ec0a4dd1f60ebddb6"
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