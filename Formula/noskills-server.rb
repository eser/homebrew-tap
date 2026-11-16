class NoskillsServer < Formula
  desc "Persistent Claude Code sessions that survive reboots"
  homepage "https://github.com/eser/stack"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-server-v5.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "1f73b5bb10aee9cdd38bf3fc1e72f0a87aa735ece6d1cf488512d09ad6e5f939"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-server-v5.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "8f5e2054ba625ce47a2d1bdf6d9d8aa94b894d30b7f9f9597c213825bcc3e080"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-server-v5.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "342f440c84861cb7e5a0096035dbdae94495cd2185b308084574c88d63a3a4ed"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v5.0.0/noskills-server-v5.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42992f5de93a84db806306093cb11b4367cf48c40efdeaf0aca42dedaee53c49"
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
