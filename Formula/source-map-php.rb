class SourceMapPhp < Formula
  desc "CLI-first PHP code search indexer for Laravel and Hyperf repositories"
  homepage "https://github.com/dickwu/source-map-php"
  url "https://crates.io/api/v1/crates/source-map-php/0.1.3/download"
  sha256 "fe23dbfca458496b7955812a006f067fa22733628c6c95ed44ac0409a46ca001"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "."), "--bins"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/source-map-php --version")
  end
end
