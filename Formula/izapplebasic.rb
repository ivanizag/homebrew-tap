class Izapplebasic < Formula
  desc "Run the unmodified Apple II+ Applesoft BASIC ROM as a console application"
  homepage "https://github.com/ivanizag/izapplebasic"
  version "0.0.0"
  license "GPL-3.0-only"

  # Placeholder until the first release of izapplebasic is published.
  # ./update-izapplebasic.sh <version> rewrites this file automatically.
  url "https://github.com/ivanizag/izapplebasic/archive/refs/heads/main.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  def install
    bin.install "izapplebasic"
  end

  test do
    output = shell_output("#{bin}/izapplebasic -h 2>&1")
    assert_match "Usage", output
  end
end
