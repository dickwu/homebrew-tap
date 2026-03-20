class CronRs < Formula
  desc "Systemd timer management platform with error hooks and observability"
  homepage "https://github.com/dickwu/cron-rs"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dickwu/cron-rs/releases/download/v#{version}/cron-rs-aarch64-apple-darwin.tar.gz"
      sha256 "" # Updated automatically by release CI
    else
      url "https://github.com/dickwu/cron-rs/releases/download/v#{version}/cron-rs-x86_64-apple-darwin.tar.gz"
      sha256 "" # Updated automatically by release CI
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dickwu/cron-rs/releases/download/v#{version}/cron-rs-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "" # Updated automatically by release CI
    else
      url "https://github.com/dickwu/cron-rs/releases/download/v#{version}/cron-rs-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "" # Updated automatically by release CI
    end
  end

  def install
    bin.install "cron-rs"
  end

  test do
    assert_match "cron-rs", shell_output("#{bin}/cron-rs --help")
  end
end
