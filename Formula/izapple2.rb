class Izapple2 < Formula
  desc "Apple ][+ and //e emulator"
  homepage "https://github.com/ivanizag/izapple2"
  url "https://github.com/ivanizag/izapple2/releases/download/v2.3.0/izapple2-macos-universal.tar.gz"
  sha256 "a7d30b60faca5a04b652c740349d4bf6e12bb77c808b98ee8425bf8f25ac53bc"
  license "GPL-3.0-only"

  def install
    bin.install "izapple2"
  end

  test do
    output = shell_output("#{bin}/izapple2 -h 2>&1")
    assert_match "Usage:", output
  end
end
