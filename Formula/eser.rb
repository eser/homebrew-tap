class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.54"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.54/eser-v4.1.54-aarch64-apple-darwin.tar.gz"
      sha256 "fdd8e2c562fe53e781960c375751a5fb722943b3758f2fbff7d49ef6cd953e10"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.54/eser-v4.1.54-x86_64-apple-darwin.tar.gz"
      sha256 "ec8b50ae780c4d970baeb2f525e1aab1b810f6978beb8eb16ee2e7bf01e4dfa0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.54/eser-v4.1.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "054fbd0b64713de8765bea2594b2449c79c14541e57f45921c1e62a788c2dcf6"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.54/eser-v4.1.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18ad19bde38febd2b445c53bf762ec94766695c16b692e3da9b215c4be9e8f14"
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
