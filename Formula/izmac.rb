class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "https://github.com/ivanizag/izmac/releases/download/v1.0.0/izmac-macos-universal.tar.gz"
  sha256 "c40a4c4dabfc46bd0698ab64c1ca24babdc472c82f5c0c11ffd86ec262abf8d1"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
