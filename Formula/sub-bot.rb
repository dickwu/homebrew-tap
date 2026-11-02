class SubBot < Formula
  desc "Self-hosted Rust agent server with sessions, async tasks and signed webhooks"
  homepage "https://github.com/dickwu/sub-bot"
  version "0.9.3"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "66432d92819b08ddc9a94516c5ab8ebfefdf42d61511e1804400ff8a412c3a0c"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "05653e688bbbca5435db2f6669965ab5beb45c1480f802c370de0b314797227f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "220d3688e534ff8d7a45d3d480554c59f804e14b0753d0af033ac74c9618039c"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77e25956156e98929b59d59cb22acbd4ae044f22986c7650db853db49bdead8c"
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
