class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.36"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.36/eser-v4.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "519741853a0a76b3a69aafcfb816ed844fa63e99719d25a93609f5648b96b095"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.36/eser-v4.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "14a4ec1fabb39e448118659fc69124dd4f5a252571946a15a82696d761ac92ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.36/eser-v4.1.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75471a4c69f40867d9fd63af233a36fe145b58ca15315a2bae865ca980f76494"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.36/eser-v4.1.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e903cffbf8ad892fcedac0a7a981430f3dc7ec5dcd8f030fd60a8382512ffc6"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
