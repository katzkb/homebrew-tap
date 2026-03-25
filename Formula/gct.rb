class Gct < Formula
  desc "Terminal UI tool for overseeing Git/GitHub workflows"
  homepage "https://github.com/katzkb/git-control-tower"
  version "0.0.11"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e40e60e5a4895fa0d763158d8b9591f1450075ec4b5ab29fb2910d209def4be7"
    else
      url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c1905f43c00207a6d3fd510e31a68a982307383430df9bc3354475cb0cbdd6b8"
    end
  end

  on_linux do
    url "https://github.com/katzkb/git-control-tower/releases/download/v#{version}/gct-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e6d7660d939729efdd283c1ad75a174365d22e14c36ff1d21afb126d463cadad"
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
