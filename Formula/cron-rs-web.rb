class CronRsWeb < Formula
  desc "Web dashboard for cron-rs — single binary with embedded Next.js UI"
  homepage "https://github.com/dickwu/cron-rs-web"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dickwu/cron-rs-web/releases/download/v#{version}/cron-rs-web-aarch64-apple-darwin.tar.gz"
      sha256 "" # Updated automatically by release CI
    else
      url "https://github.com/dickwu/cron-rs-web/releases/download/v#{version}/cron-rs-web-x86_64-apple-darwin.tar.gz"
      sha256 "" # Updated automatically by release CI
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dickwu/cron-rs-web/releases/download/v#{version}/cron-rs-web-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "" # Updated automatically by release CI
    else
      url "https://github.com/dickwu/cron-rs-web/releases/download/v#{version}/cron-rs-web-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "" # Updated automatically by release CI
    end
  end

  def install
    bin.install "cron-rs-web-server"
  end

  def caveats
    <<~EOS
      cron-rs-web requires the cron-rs daemon running:
        brew install dickwu/tap/cron-rs
        cron-rs init && cron-rs daemon

      Then start the web dashboard:
        cron-rs-web-server
        # Open http://localhost:3000
    EOS
  end

  test do
    assert_match "cron-rs", shell_output("#{bin}/cron-rs-web-server --help")
  end
end
