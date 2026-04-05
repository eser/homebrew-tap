class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.55"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.55/eser-v4.1.55-aarch64-apple-darwin.tar.gz"
      sha256 "7a8a531930b31aca21a32e808a6fbb580dd866d0a17da271496c3d187cf58a21"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.55/eser-v4.1.55-x86_64-apple-darwin.tar.gz"
      sha256 "72360d581592958649ff05a515da297e27e1ed0d8be1fe4b543fbb74680a5a3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.55/eser-v4.1.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3bbe50668bbcee89582c60dca1e516e7496b456b90ed29dcc1d07661f8d2e81"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.55/eser-v4.1.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a315db578cfc8b3e300307aec062df07625fea2c4f300e7740e2e50922b4fe6a"
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
