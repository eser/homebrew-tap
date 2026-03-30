class Eser < Formula
  desc "Terminal client for Eser's work"
  homepage "https://github.com/eser/stack"
  version "4.1.43"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.43/eser-v4.1.43-aarch64-apple-darwin.tar.gz"
      sha256 "189d39f951b31320e7ac28b254f440ac44a5dc3b71f55fd587bc7a06b695e1ae"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.43/eser-v4.1.43-x86_64-apple-darwin.tar.gz"
      sha256 "07863f618391b32e28289470b36c3952114e6c110dfc96798e05cab68413dbac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eser/stack/releases/download/v4.1.43/eser-v4.1.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60476369f3601782c224cd0ead28af6c410a467136bf02993f549bdbce1bd0ec"
    end
    on_intel do
      url "https://github.com/eser/stack/releases/download/v4.1.43/eser-v4.1.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ec2358487d759d4d5006284ca4197e2675877996ef706acffa8322b85759241"
    end
  end

  def install
    bin.install "eser"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eser version --bare")
  end
end
