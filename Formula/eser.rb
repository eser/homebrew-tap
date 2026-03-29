class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.40"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.40/eser-v4.1.40-aarch64-apple-darwin.tar.gz"
      sha256 "246b674419f8b84aa5dc743da1997133180e708c8568e82f24a92fd247375ea1"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.40/eser-v4.1.40-x86_64-apple-darwin.tar.gz"
      sha256 "c6cf7d4e2fc8ca698a825ac4f10746633324788d25464c8c2fe8467fc99d07db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.40/eser-v4.1.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3716274518e68b506dc2da0b35bd278f06a988f249a7261a03128f69b646c976"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.40/eser-v4.1.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f34508049e98154427f76124d50d81615b4d7777ef776633bf145751059a301d"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
