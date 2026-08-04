class Izapple2 < Formula
  desc "Apple ][+ and //e emulator"
  homepage "https://github.com/ivanizag/izapple2"
  url "https://github.com/ivanizag/izapple2/releases/download/v2.4.0/izapple2-macos-universal.tar.gz"
  sha256 "d3c0eba5021bbe1b1ff3ae4b98749169b41db6bc7cf14835b6a249fdf15e190d"
  license "GPL-3.0-only"

  def install
    bin.install "izapple2"
  end

  test do
    output = shell_output("#{bin}/izapple2 -h 2>&1")
    assert_match "Usage:", output
  end
end
