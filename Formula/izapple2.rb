class Izapple2 < Formula
  desc "Apple ][+ and //e emulator"
  homepage "https://github.com/ivanizag/izapple2"
  url "https://github.com/ivanizag/izapple2/releases/download/v2.5.0/izapple2-macos-universal.tar.gz"
  sha256 "114774f94d881e889bb779cefb7e1af4e54205c2dbd4e4bb3a6cac4b41a33c94"
  license "GPL-3.0-only"

  def install
    bin.install "izapple2"
  end

  test do
    output = shell_output("#{bin}/izapple2 -h 2>&1")
    assert_match "Usage:", output
  end
end
