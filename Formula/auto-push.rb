class AutoPush < Formula
  desc "CLI tool that automates git workflow with AI-generated commit messages"
  homepage "https://github.com/dickwu/auto-push"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-apple-darwin.tar.gz"
      sha256 "424258f2e6125e7762f33f43a8b8866198dd7457122b19053669b68b00b3ec39"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-apple-darwin.tar.gz"
      sha256 "2aced5a562ae350b91ec0ba4ead15083d16b6ac609224abbd525cad2bf5b8c8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2ed90f82b2faf0378ee9b8716505c871534f897ce7d9fda27d7b4ba93ece3be"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b46a7c07e41c0231dd1510434a1ce73a2551944a0cfe90a73e780caa793132cb"
    end
  end

  def install
    bin.install "auto-push"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auto-push --version")
  end
end
