class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "https://github.com/ivanizag/izmac/releases/download/v1.4.0/izmac-macos-universal.tar.gz"
  sha256 "4f20f5dd8684c0b7a459995a2bc99a6fbbf832a9c8746b78e8f73126ab0b62ba"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
