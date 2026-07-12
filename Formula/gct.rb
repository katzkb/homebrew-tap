class Gct < Formula
  desc "Terminal UI tool for overseeing Git/GitHub workflows"
  homepage "https://github.com/katzkb/git-control-tower"
  version "0.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2351eda883d5950c021d04387307af4f48b3e44656fb047ac54ccb87a73204a3"
    else
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6c176df072a903752e1e43a8b1af44ec1429ef8cf0022d25db43a3f29005af86"
    end
  end

  on_linux do
    url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "05ea7c2bd802795c1967e8c83f7ebe82af957367320625d10158e5d78004d59c"
  end

  depends_on "git"
  depends_on "gh"

  def install
    bin.install "gct"
  end

  test do
    assert_predicate bin/"gct", :exist?
    assert_predicate bin/"gct", :executable?
  end
end
