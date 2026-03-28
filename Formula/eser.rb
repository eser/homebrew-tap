class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.35"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.35/eser-v4.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "4f6765425f136050fe813eefa0671c1ffc8ea84b5e730ab6d811d2d0d08b160b"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.35/eser-v4.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "3aa7a2a197a0c52fa24ca28c5fb60434ba2620846950c5a244473ead233447c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.35/eser-v4.1.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c15f8447484dfccd34344a9ac699b89af12d05578b2b2f803770852d7c58b4e0"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.35/eser-v4.1.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63dd87d040864a5a559b01cbae6d5a40c7aa3030d19eaf66c4d65d31de0d2a95"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
