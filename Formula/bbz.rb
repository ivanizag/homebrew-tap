class Bbz < Formula
  desc "Run 6502 programs using the Acorn MOS on a modern operating system as a console application"
  homepage "https://github.com/ivanizag/bbz"
  version "1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v1.0/bbz_Darwin_arm64.tar.gz"
      sha256 "69d21928da392053999c1edfcdd2984645d656561c67dd00657cd668c9ba1d19"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v1.0/bbz_Darwin_x86_64.tar.gz"
      sha256 "47ae99a2aae9f0aa1e39eb45a8c560a7e330795a67f1597c4397eaacda110d7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v1.0/bbz_Linux_arm64.tar.gz"
      sha256 "e2982af025b991a5183a82cd39ccc7ab5e9a1860446c1f84a8723ca2f71a7741"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v1.0/bbz_Linux_x86_64.tar.gz"
      sha256 "9669c166c0c521462f483d6d6bc42a3a4352d052dfdc5334d7b44ea1b3f31115"
    end
  end

  def install
    bin.install "bbz"
  end

  test do
    output = shell_output("#{bin}/bbz --help 2>&1")
    assert_match "Usage:", output
  end
end
