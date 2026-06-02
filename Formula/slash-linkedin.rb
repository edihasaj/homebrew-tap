class SlashLinkedin < Formula
  desc "Local LinkedIn CLI for posting from the command line"
  homepage "https://github.com/edihasaj/slash-linkedin#readme"
  url "https://github.com/edihasaj/slash-linkedin/releases/download/v0.1.0/slash-linkedin-0.1.0.tar.gz"
  sha256 "4afabfb41f4a48ada77265268fcbbe6aa6c9108ba621e9858cc6816f45b349cf"
  license "MIT"
  version "0.1.0"

  # Intentionally no `depends_on "node"`: the tarball bundles its own
  # node_modules, and the wrapper runs whatever node is already on PATH
  # (e.g. an nvm-managed runtime), so installing slash-linkedin never pulls a
  # second Node onto the machine.

  def install
    libexec.install Dir["*"]
    %w[slash-linkedin sli].each do |name|
      (bin/name).write <<~EOS
        #!/bin/bash
        exec node "#{libexec}/dist/cli.js" "$@"
      EOS
      chmod 0755, bin/name
    end
  end

  test do
    assert_match "slash-linkedin", shell_output("#{bin}/slash-linkedin --version 2>&1", 0)
  end
end
