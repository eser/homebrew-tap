class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.34"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.34/eser-v4.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "0824647ade2d8ce910611d6aed30c90840965d076fc4d684b73f282987c25a7d"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.34/eser-v4.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "52467e608aaca92c647c001aa087156a9250e8563b47a5bb4e1b19effe0800fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.34/eser-v4.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b04f6fc7a445b2991ca14959c38464d534bfd714c4d6be8e032ab5de3a7073ad"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.34/eser-v4.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e5c9c3dff319b3a8ae170a0fe13bd05eb23056fb5aa290d442e3348c8239858"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
