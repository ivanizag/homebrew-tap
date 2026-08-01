class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "https://github.com/ivanizag/izmac/releases/download/v1.1.0/izmac-macos-universal.tar.gz"
  sha256 "ecc259bfdeca8162a09a0679e0aa81d3934bd3e48b210e4613190d4b9f38d2e5"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
