class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.47"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.47/eser-v4.1.47-aarch64-apple-darwin.tar.gz"
      sha256 "1474bcd453bfa4138f7efe02481c552c8ecdff433730b828d6066f5a24d85d67"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.47/eser-v4.1.47-x86_64-apple-darwin.tar.gz"
      sha256 "76d4d7193e8274cb853ba173efccaef4da26ebc4df2986efc0a48aab4c2ea8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.47/eser-v4.1.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75b95cdc9e92084ebedca72d10ba4db23a2c59c21d6470faa4a831ad64019774"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.47/eser-v4.1.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60c73593d1e18a0f0f6ee840483b62d89b71c98f37abb31653f3cf28cc27414a"
    end
  end

  def install
    bin.install "eser"

    # Install the Go shared library if present in the archive (added in newer releases).
    # On macOS the library is a .dylib; on Linux it is a .so.
    if File.exist?("libeser_ajan.dylib")
      lib.install "libeser_ajan.dylib"
    elsif File.exist?("libeser_ajan.so")
      lib.install "libeser_ajan.so"
    end

    # Install the C header for FFI consumers if present.
    if File.exist?("libeser_ajan.h")
      include.install "libeser_ajan.h"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")

    # Verify the Go bridge is functional when the shared library is installed.
    if (lib/"libeser_ajan.dylib").exist? || (lib/"libeser_ajan.so").exist?
      assert_match(/\d+\.\d+/, shell_output("#{bin}/eser go version"))
    end
  end
end
