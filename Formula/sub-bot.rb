class SubBot < Formula
  desc "Self-hosted Rust agent server with sessions, async tasks and signed webhooks"
  homepage "https://github.com/dickwu/sub-bot"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e62273d8d3da653dbdf844d18873b78f36d2676c707446edb7023815fd693c26"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2532f3b49b8ced1bb3303cf587bdc2901b0820749584cbfc0e8c79be9046878f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "66267b1b38b2628fa71a9894802c7f03c504d40a134ed89e1994aeed828217ba"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "97d5776c1d1c6ad910af63cd520ad9d4bc292756e54176cd3347d22a8ed96b26"
    end
  end

  def install
    bin.install "sub-bot"
    pkgshare.install "sub-bot.example.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sub-bot --version")
  end
end
