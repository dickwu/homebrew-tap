class Ironguard < Formula
  desc "Modern cross-platform WireGuard implementation in Rust"
  homepage "https://github.com/dickwu/ironguard"
  version "0.2.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-aarch64.tar.gz"
      sha256 "bea8325493559a300f6bd1901e6177faf8956ff71cc79e844097c86984079de8"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-macos-x86_64.tar.gz"
      sha256 "abf35b79fdf8f7bb195e02823402dba373dce488522fb8809a5c6202c0a951ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-aarch64.tar.gz"
      sha256 "03c7a972728c0518a4371de7a092d34a640007c4ff483df0761f7bd6c5eaa8a7"
    end

    on_intel do
      url "https://github.com/dickwu/ironguard/releases/download/v#{version}/ironguard-linux-x86_64.tar.gz"
      sha256 "6d6b3da48129741cd3bc4ed91ad8e3ef185eecc2765cd8573d65cae827bc3d36"
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