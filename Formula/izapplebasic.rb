class Izapplebasic < Formula
  desc "Run the unmodified Apple II+ Applesoft BASIC ROM as a console application"
  homepage "https://github.com/ivanizag/izapplebasic"
  version "0.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/izapplebasic/releases/download/v0.1/izapplebasic_Darwin_arm64.tar.gz"
      sha256 "c874d9305c2083426158c93e7e4f7ebf9ccbd1a7edf32bf8be2b20d0ac95bdf7"
    end
    on_intel do
      url "https://github.com/ivanizag/izapplebasic/releases/download/v0.1/izapplebasic_Darwin_x86_64.tar.gz"
      sha256 "0aca6531be80c921ba324bca571d7fdd66d6c9eb98de3919c60de04e49941f7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivanizag/izapplebasic/releases/download/v0.1/izapplebasic_Linux_arm64.tar.gz"
      sha256 "f7ce2bffaee833fce252902b7378714c9be90fe582ff3acff7c5e9abcfccad9b"
    end
    on_intel do
      url "https://github.com/ivanizag/izapplebasic/releases/download/v0.1/izapplebasic_Linux_x86_64.tar.gz"
      sha256 "4790a5b3f03aeea468886e11678a0f7aafcc3555d959be702b8bdb10ee4db710"
    end
  end

  def install
    bin.install "izapplebasic"
  end

  test do
    output = shell_output("#{bin}/izapplebasic -h 2>&1")
    assert_match "Usage", output
  end
end
