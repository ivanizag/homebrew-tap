class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "https://github.com/ivanizag/izmac/releases/download/v1.2.0/izmac-macos-universal.tar.gz"
  sha256 "1e5a09857ad17bf40a53f0ff9cd67ac02ab8cc98479df964951e332a4db906c0"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
