class Disc < Formula
  desc "Disc command-line interface"
  homepage "https://github.com/disctech/disc-cli"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.0/disc-aarch64-apple-darwin.tar.gz"
    sha256 "90f7aa3d02ef0995afad2929aa5bd47c27c22633ba91d9b165dcce0df174a89d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.0/disc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "790ba54cbc1241d16f2d33745e8be8efa892e0dfbfff5851a025f96df55cb5bf"
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
