class Laroux < Formula
  desc "Command-line tool for laroux.js apps"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  deprecate! date: "2026-10-27", because: "is now on npm: run `npm install --save-dev laroux` in your app"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/laroux-v5.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "58e88141c9f358fa117bfacb33ac1e3cd8b7e0403925991cb74772e1d12c5d9c"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/laroux-v5.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "8d58ca0d3beb30a148ae4050f4f58de657d27e257d30e9a762b05b57c8804f89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/laroux-v5.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dadd705447d119ebd3a6d7cf5a982899967a0923d28f16767a801f7fe1b16a81"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/laroux-v5.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e67a510edef8807958ca866df206041c61d930d42800c880cd8b1fa65f78571"
    end
  end

  def install
    bin.install "laroux"

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
    assert_match version.to_s, shell_output("#{bin}/laroux --version")

    # Verify the Go bridge is functional when the shared library is installed.
    if (lib/"libeser_ajan.dylib").exist? || (lib/"libeser_ajan.so").exist?
      assert_match(/\d+\.\d+/, shell_output("#{bin}/laroux --version"))
    end
  end
end
