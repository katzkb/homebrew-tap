class Gct < Formula
  desc "Terminal UI tool for overseeing Git/GitHub workflows"
  homepage "https://github.com/katzkb/git-control-tower"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6a14827201a1d8f753237bfe2c4682a8f4bfe5eb2d3d25f9650f6479e3a03c07"
    else
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f54caa43c85e0b96ce1dfb586bf8d362e8fc70e599c219a309310687d4dec17e"
    end
  end

  on_linux do
    url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a6f7ede4fd68d19268219ef8eb4d641148983054025fbcbb59ee9dc393e7e7b7"
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
