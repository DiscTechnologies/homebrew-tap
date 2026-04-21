class Disc < Formula
  desc "Disc command-line interface"
  homepage "https://github.com/disctech/disc-cli"
  version "0.1.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.2/disc-aarch64-apple-darwin.tar.gz"
    sha256 "cf48add9e53aed24655b917f41e42ad01a3da0c607864cabd6ade46890940f8a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.2/disc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40aef4a073afe0de92361499c30b373c93093b245dea13c39633f30755115869"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "disc"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/disc --version")
  end
end
