class Gct < Formula
  desc "Terminal UI tool for overseeing Git/GitHub workflows"
  homepage "https://github.com/katzkb/git-control-tower"
  version "0.0.22"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0708eb18c7e37ac22bc2e9b72be0bf94f3cc857485b94428c5bd4c7aeaa0cb96"
    else
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c055be397dd3b786cfee4c735bf17c95d5bec413d3f3d484805df88fed924409"
    end
  end

  on_linux do
    url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4f2a2192c74c4e08025df347fe18f6262a8b58234c57a05dff21d946a5b40e24"
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
