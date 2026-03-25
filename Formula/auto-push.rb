class AutoPush < Formula
  desc "CLI tool that automates git workflow with AI-generated commit messages"
  homepage "https://github.com/dickwu/auto-push"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-apple-darwin.tar.gz"
      sha256 "4b1b09a2fdc9e5e2e5b61ddec2eaf475b3b2813e34489d4bdbff490e4438dbc3"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-apple-darwin.tar.gz"
      sha256 "23cd360a6d9485d1571a3c3fd3e1fe763e7ca77c81b9782517a63d29cb65c88a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf8c4e1a98851020d0b105cd28bfa35496f9e33304ba8cac713f6ee24a903f14"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55df0a5fea591b07fabdc25d2660136c0c55dbc3b2e60150fe31c2fcb1f21920"
    end
  end

  def install
    bin.install "auto-push"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auto-push --version")
  end
end
