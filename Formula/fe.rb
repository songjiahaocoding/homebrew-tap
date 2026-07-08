class Fe < Formula
  desc "Agent-friendly structured file editor for JSON and YAML"
  homepage "https://github.com/songjiahaocoding/fe"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.1/fe-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "6811ca3bb1cca7bb5afad6d375c3d4f001c1f6f127b2d9a8d57d7926b77ca94e"
    else
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.1/fe-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "3887c8df9e12cabef011ea9d9670dfbe18bea05b3db3eadf3fc957606d07ae44"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/songjiahaocoding/fe/releases/download/v0.2.1/fe-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "151bd46bdd431585e1090121f2dda6606a54fa0c58585fddcdebc8cc06bce7c0"
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
