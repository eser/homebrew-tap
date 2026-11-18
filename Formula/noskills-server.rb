class NoskillsServer < Formula
  desc "Persistent Claude Code sessions that survive reboots"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-server-v5.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f7cda0ede8d29e09e7952a01560439f36df1735256fd32cbfdb9a7de484e2492"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-server-v5.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d66ad928dc97706b41e67baf6199b5d3730ba6a557b8ab1689f6b9bb56bb594"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-server-v5.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f957701b0738361074c09d39b7fe33a6d59e271cb28a6a03a6dd505f19c1594e"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.1.0/noskills-server-v5.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5babd900ce04fac20aa4b48ab3d3b1c542b0a8206fba38b795a4ffdf5acb386"
    end
  end

  def install
    bin.install "noskills-server"

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
    assert_match version.to_s, shell_output("#{bin}/noskills-server --version")

    # Verify the Go bridge is functional when the shared library is installed.
    if (lib/"libeser_ajan.dylib").exist? || (lib/"libeser_ajan.so").exist?
      assert_match(/\d+\.\d+/, shell_output("#{bin}/noskills-server --version"))
    end
  end
end
