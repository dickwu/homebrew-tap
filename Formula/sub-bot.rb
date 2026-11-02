class SubBot < Formula
  desc "Self-hosted Rust agent server with sessions, async tasks and signed webhooks"
  homepage "https://github.com/dickwu/sub-bot"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a35dd98b18dabd76b94dce4fde3300358556e90b5c4b1ea06fbf60ce124ab650"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ab6bd21c0c9a90b51fd29ae77b2bc670d7a356a24765ad35753b9a6353ab832e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "82717a5713555beae4b39b1cac4e03a7a4f7ee8aa330d524e98e188304a72845"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c9365391c05ef04f7b1b42dcdf850457804918deae6eac3fbb2b5edbf240efbe"
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
