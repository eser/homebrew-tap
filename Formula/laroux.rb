class Laroux < Formula
  desc "Command-line tool for laroux.js apps"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  deprecate! date: "2026-10-27", because: "is now on npm: run `npm install --save-dev laroux` in your app"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/laroux-v5.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7382236801912be05d70948af68a239075ad77bc45038135d51fade775e2e18b"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/laroux-v5.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6cb639b9625c6c34e0e7b4dda423b043bbf4ffb906d688122be4fa9be23e6000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/laroux-v5.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95094ab14e3583649c8309458e883ecd5e1f4fbd1c515a21edcfaa4a61a3d475"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/laroux-v5.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c53f3943f98ebbc6a874d8ffe1110d3cea13c81415ab185fee346872b3504a2e"
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
