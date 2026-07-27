class Disc < Formula
  desc "Disc command-line interface"
  homepage "https://github.com/DiscTechnologies/disc-cli"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.0/disc-aarch64-apple-darwin.tar.gz"
    sha256 "f2d22a76145aac060b7e9a3df827d93f663c1f3c7273bcffd4c7f4197d0382d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.0/disc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db5c1d2aa2ee90aa743caa221c7292d02c1d88adecd9c806a5e77fc85dd25a20"
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
