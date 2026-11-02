class Izapple2 < Formula
  desc "Apple ][+ and //e emulator"
  homepage "https://github.com/ivanizag/izapple2"
  url "https://github.com/ivanizag/izapple2/releases/download/v2.6.0/izapple2-macos-universal.tar.gz"
  sha256 "09ed6e2a370d8bc1fd4b259c91ccb4d19d221b6a0b428878887f439649d6d807"
  license "GPL-3.0-only"

  def install
    bin.install "izapple2"
  end

  test do
    output = shell_output("#{bin}/izapple2 -h 2>&1")
    assert_match "Usage:", output
  end
end
