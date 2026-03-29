class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.39"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.39/eser-v4.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "a45923d575ed2d9f11b2be626729bd50d1837eb99d511d4a234d873942f31501"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.39/eser-v4.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "2604e83409068b58dcf63c656a4142a1b0323453460d5073ee539bccdac4ad38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.39/eser-v4.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "540a0cc50ac1e67c3fb038187d9cd5ff4a86dfb813d51eb1fe3b38e0080ea002"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.39/eser-v4.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d88008d68321c30e1c7c61c1497f2592c74800daa4b78ee9d8847ca3e09f7e84"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
