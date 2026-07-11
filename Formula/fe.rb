class Fe < Formula
  desc "Agent-friendly structured file editor for JSON and YAML"
  homepage "https://github.com/songjiahaocoding/fe"
  version "0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.3/fe-v0.3-aarch64-apple-darwin.tar.gz"
      sha256 "ae3b288b8a2842475f89b46b0842c1d6f93885732ead214a877e01e6434ca224"
    else
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.3/fe-v0.3-x86_64-apple-darwin.tar.gz"
      sha256 "ba5e67bf84df3bf05745f2489414f7ca9da23de81fa3c2f6d2f1d5a4a4f6ca19"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.3/fe-v0.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "468c8a4c954181dba06b983815729c6c4d6d729b93f2c41ef1082e973f263867"
    else
      odie "fe does not provide a Linux ARM64 Homebrew bottle yet"
    end
  end

  def install
    bin.install "fe"
  end

  test do
    assert_match "Usage: fe", shell_output("#{bin}/fe --help")
  end
end
