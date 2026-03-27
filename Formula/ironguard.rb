class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "0b9076855f3c4ae9df1e04820dcb8c9adcea311a696ce511d725e24cd1264616"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "21e56dc1ab4f1e303722fe8fc8b9d85e8176e6cc9862b8be3a03f1fbe881c967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "8112805ed091da24822a7ba01a75268adee9d89f8d906888df48c74c050a1cce"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "b9861bfbe3bc90be4fd76b031e18a70526f285008b84f7462d15ea582f671799"
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