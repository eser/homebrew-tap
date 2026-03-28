class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.37"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.37/eser-v4.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "49c43ab2e48ddb39e2da2c5bfb4feb1ba8a10d8f4d4036b34190356853cffaed"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.37/eser-v4.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "e58ca32f5c0fa7f7ef74aa4dbf30de1a38e370afea4fe562f3192eea6cb85def"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.37/eser-v4.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30f1883d885c0efba5aa5933f19f49059f239659bbae0a132dd25837661493e8"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.37/eser-v4.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cca8efe6195c4996b58813685496bcfb1c01cfcf4e8985e670f7e2c5b82fdd7d"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
