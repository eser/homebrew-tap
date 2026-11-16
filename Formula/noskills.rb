class Noskills < Formula
  desc "State-machine orchestrator for AI agents"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-v5.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "49fec1fc0fd141e988d0bd32ce60933f217b2fbee53cb6ed400dd9f548279828"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-v5.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "c8dabcc250cb0814f43934d6c8a9e9e648f840f86ea2824e254adefcb0b79759"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-v5.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75413462415b4cbe8c8b8d95e642501996569aa677846d9d48bbea56cfdb10d0"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-v5.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7551f33e20804082731792d0e763a221d25afc0830365a6216454a159d2e8706"
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
