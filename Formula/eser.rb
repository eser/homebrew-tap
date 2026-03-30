class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.42"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.42/eser-v4.1.42-aarch64-apple-darwin.tar.gz"
      sha256 "6ccdbc0d8e021e29bf0ec8887c8b9653d3d7b542bdda909d7245550bb66d39fc"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.42/eser-v4.1.42-x86_64-apple-darwin.tar.gz"
      sha256 "7ab746d566ddd228d780867fbb6ed96d58c90c450dfb12e921bb6c3c9bf195fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.42/eser-v4.1.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fefb01f45e4a44aec1180a6c8584d2bd40cf587be5e06754b455715fcd44063"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.42/eser-v4.1.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8aa9d9fa4a90189e9429d2f27d448064a3d08a772524e837b7485eca8c60d6b1"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
