class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.56"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.56/eser-v4.1.56-aarch64-apple-darwin.tar.gz"
      sha256 "44ce5ac614c3ca9ba64845d95f0e4534ddf1d003304642a992407612a2728d89"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.56/eser-v4.1.56-x86_64-apple-darwin.tar.gz"
      sha256 "cd30ab0c8465a1b6b3a170ab8b554399cf618c9a97ef068b4cb01e36b9f8c7a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.56/eser-v4.1.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "506693757295a33e33f9ee81f8cccf6f77cc8205c459b280e3d587141428d88b"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.56/eser-v4.1.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "721de2b289e6fcb2cbadb5b70b8ec790ed87b29980284d30a59ced9c3ae33b10"
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
