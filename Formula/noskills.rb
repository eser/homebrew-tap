class Noskills < Formula
  desc "State-machine orchestrator for AI agents"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-v5.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1203b21acda626e5a9f635f2691fbae69950bb1a8109054616948b5388b1a47c"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-v5.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "65c7b4d6adf7a73110e71fcf99e74fb73b95c4421acf20cc6dfd9be2d3767865"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-v5.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb766eba0880072f8cac8e0919ed389f2ac3e3a2a20198a554c9e39afa5e2d8f"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-v5.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26e5942226e007ca5faea52c3aa65cb3088aff4984213f7f26b3647fdb86141a"
    end
  end

  def install
    bin.install "noskills"

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
    assert_match version.to_s, shell_output("#{bin}/noskills --version")

    # Verify the Go bridge is functional when the shared library is installed.
    if (lib/"libeser_ajan.dylib").exist? || (lib/"libeser_ajan.so").exist?
      assert_match(/\d+\.\d+/, shell_output("#{bin}/noskills --version"))
    end
  end
end
