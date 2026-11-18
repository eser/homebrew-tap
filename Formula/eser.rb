class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/eser-v5.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3a3276e070a83e61305646c2d5f58769c70f54b1ce5dc6d0c3c481128a857c5e"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/eser-v5.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "7a3865c5e91797232b559f5deed1fa5d78d37c82657139be860262e435a2fc41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/eser-v5.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af23512758d6f2698fa5810d3dad3518f5a3688acb88f975872bd65ca77317fb"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/eser-v5.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c2d694f3202709eb799cf931237c3ea51ebe772d3149ed137d996ca9c70f2e8"
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
    assert_match version.to_s, shell_output("#{bin}/eser --version")

    # Verify the Go bridge is functional when the shared library is installed.
    if (lib/"libeser_ajan.dylib").exist? || (lib/"libeser_ajan.so").exist?
      assert_match(/\d+\.\d+/, shell_output("#{bin}/eser --version"))
    end
  end
end
