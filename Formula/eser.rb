class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.41"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.41/eser-v4.1.41-aarch64-apple-darwin.tar.gz"
      sha256 "6892a6f46c4b900be013e51720031f0b1a06dd4c310cb59c56adddaa0e25e951"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.41/eser-v4.1.41-x86_64-apple-darwin.tar.gz"
      sha256 "94e025ecf91c5a40168bb3c3dcbc07825673baed9812efd5fe577c0321c3c28c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.41/eser-v4.1.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e90f436bbfeefffd2bae7487bce3a08c2f9f4adb8e11e0628e0feba3c65499b6"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.41/eser-v4.1.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bca779cba7a79afe1fa5fe16d314fd7b2b60d3e743284a52a8f0d22c6e910a36"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
