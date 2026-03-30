class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.44"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.44/eser-v4.1.44-aarch64-apple-darwin.tar.gz"
      sha256 "07a6250ca7fd434e83dff8217a7453968cd92aee00f6d8c98a28bba178bafc31"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.44/eser-v4.1.44-x86_64-apple-darwin.tar.gz"
      sha256 "4e9fc502ad9276a70823fa55b69ac9bcdffd2e3e2981dfa9b5a77c15a1b9546b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.44/eser-v4.1.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df3fe7894dd9d575f528273dbb000335020ae4af75f5384c7a4b9f725232276c"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.44/eser-v4.1.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "923d8614b2b81099fd949f7b01ab4e3ad992390d23be6a9979d285b08756cc6f"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
