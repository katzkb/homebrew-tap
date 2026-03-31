class Gct < Formula
  desc "Terminal UI tool for overseeing Git/GitHub workflows"
  homepage "https://github.com/katzkb/git-control-tower"
  version "0.0.21"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "efb891aded7b58f917007dfc177469d1d4a7238f87215e7f2f44765a3c802fad"
    else
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "501cfae74346606ae3399c371fe4cef858fc52b4962be57851875fa03d1ba73b"
    end
  end

  on_linux do
    url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "14d4162c7e8001183a0036425fdead7c5d3534da4b6dacb662e8f52698a8a74d"
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
