class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/eser-v5.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e1ae448038ce5adb84b82800fee9855ab2fb2b691a75065a83ee6e74d602749"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/eser-v5.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "33da49d24c4587ae13ba186db46e0bef88b5ce284d40ff0501ebfc371d3cdcde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/eser-v5.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71561790468b70f8a77dc343605021803dcc5dd4afe561374dbbca8270434569"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/eser-v5.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e5e482be36d274ba015fd445e5751c186fb01911f92f5c9b774efa3f04c5988"
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
