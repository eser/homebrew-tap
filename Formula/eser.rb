class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.33"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.33/eser-v4.1.33-aarch64-apple-darwin.tar.gz"
      sha256 "92cf3d8c32ffeb6c2e38c3676f816aa05d31a0d3bd54aba150495dc32b8ec945"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.33/eser-v4.1.33-x86_64-apple-darwin.tar.gz"
      sha256 "be4af103c19070305931513113ad845b8c57b54dc5c7000f6ab4d0040f885d28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.33/eser-v4.1.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "653fc2a443d2ea5a7f6eedb12ee5dcc1f98210478b963cb679241301c50489ce"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.33/eser-v4.1.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b129041de8358e6b329a113758d48d02bcf8e49aca6717d0abb55e8cfc0df508"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
