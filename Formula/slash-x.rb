class SlashX < Formula
  desc "Local X/Twitter CLI for posting, replying, and reading from the command line"
  homepage "https://github.com/edihasaj/slash-x#readme"
  url "https://github.com/edihasaj/slash-x/releases/download/v0.9.0/slash-x-0.9.0.tar.gz"
  sha256 "7813ee1ea4d5ae185d5a2113aa1e4e27fb02247df85c3a2b0ee7f0c71fd9cb5f"
  license "MIT"
  version "0.9.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "slash-x", shell_output("#{bin}/slash --version 2>&1", 0)
  end
end
