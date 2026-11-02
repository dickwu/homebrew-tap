class SubBot < Formula
  desc "Self-hosted Rust agent server with sessions, async tasks and signed webhooks"
  homepage "https://github.com/dickwu/sub-bot"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8912dfe2bb90a1f9f16015f8e65c845021235f4cec3a64d5392e058c9095192c"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d074db779afbb239e261befc179ce363eb57d3104ba97d40ac9b1852ca39bfb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bbf5c27da31b706760945cbc7bcd25136220a6316ff4e4338fd17e56d409b0ea"
    end

    on_intel do
      url "https://github.com/dickwu/sub-bot/releases/download/v#{version}/sub-bot-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da4c5569d41cbdb0812b1cb57971ad2b05eedf4258101e15a317d55f36d1839e"
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
