class Fe < Formula
  desc "Agent-friendly structured file editor for JSON and YAML"
  homepage "https://github.com/songjiahaocoding/fe"
  version "0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.1/fe-v0.1-aarch64-apple-darwin.tar.gz"
      sha256 "fbaf00cc583ec979e17c832e72f04dcfbd5f7d6e406e7ad493241ba9d7278509"
    else
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.1/fe-v0.1-x86_64-apple-darwin.tar.gz"
      sha256 "8ee245566270dc524b34ad526c164b41157a9cf6bc2699247d39a96d0e70e81c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.1/fe-v0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c682206198e510f56eeefbc66b17e012d4dc8f544ea3940e6983c6bdcea552c8"
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
