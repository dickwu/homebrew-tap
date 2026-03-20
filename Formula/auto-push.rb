class AutoPush < Formula
  desc "CLI tool that automates git workflow with AI-generated commit messages"
  homepage "https://github.com/dickwu/auto-push"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-apple-darwin.tar.gz"
      sha256 "7d9147f95d8981a220cad8b6d731c8d70a72ecda3e5531fbbe4343045f03fdb6"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-apple-darwin.tar.gz"
      sha256 "384bbd0ab6b031575e313ed7f31fe4290b3b7518a30450129136572faf569c52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff8623b124602f40c21c8d03c172d0c4dd439d48a00cfaa63b8918daa19f5220"
    end

    on_intel do
      url "https://github.com/dickwu/auto-push/releases/download/v#{version}/auto-push-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d41b64537583929143d29066373e0a962127b87626fe596da28d62bef39f454e"
    end
  end

  def install
    bin.install "auto-push"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auto-push --version")
  end
end
