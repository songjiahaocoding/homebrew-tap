class Fe < Formula
  desc "Agent-friendly structured file editor for JSON and YAML"
  homepage "https://github.com/songjiahaocoding/fe"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.0/fe-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ce39cbd95bb9f5bff68638e2c65950d1ccaeb786a1f47775572fb9efb5d287bb"
    else
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.0/fe-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa04b1779d57c12c7ccbc233c477752b15e6f8df1075a56e6f46456daf06385f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.0/fe-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87d11c5d4801837104e5b0e608fa8bdcc6c44a4553aace17d84cef9d6c385e10"
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
