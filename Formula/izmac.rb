class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "https://github.com/ivanizag/izmac/releases/download/v1.3.0/izmac-macos-universal.tar.gz"
  sha256 "45a13cdf3a7bda27f81f771a0c3a55b7e4b1e1484868e71ddefd7ac0c3d5ef11"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
