class Izpet < Formula
  desc "Commodore PET emulator"
  homepage "https://github.com/ivanizag/izpet"
  url "https://github.com/ivanizag/izpet/releases/download/v1.0.0/izpet-macos-universal.tar.gz"
  sha256 "4bd0953cfdce80dade176fac94cf779ffceddc14d8118c84c08845847cc5843d"
  license "MIT"

  def install
    bin.install "izpet"
  end

  test do
    output = shell_output("#{bin}/izpet -h 2>&1")
    assert_match "Usage of", output
  end
end
