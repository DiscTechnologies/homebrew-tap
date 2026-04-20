class Disc < Formula
  desc "Disc command-line interface"
  homepage "https://github.com/disctech/disc-cli"
  version "0.1.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.1/disc-aarch64-apple-darwin.tar.gz"
    sha256 "ea6bf130898092ac7d6dc5b3ea7ab3c0daa9715d5d62e2ff057d1db5060ae65f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/DiscTechnologies/disc-cli/releases/download/v0.1.1/disc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6f304d191ee0a605c67f7684b4029e215172aaec38090ab3986a85e33d2f34c"
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
