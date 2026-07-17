class Bbz < Formula
  desc "Run 6502 programs using the Acorn MOS on a modern operating system as a console application"
  homepage "https://github.com/ivanizag/bbz"
  version "0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v0.9/bbz_Darwin_arm64.tar.gz"
      sha256 "73e981d25710e65edac35a8e4a3dc5251752b6cf341ca1ff9346d7d398878fc1"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v0.9/bbz_Darwin_x86_64.tar.gz"
      sha256 "01383307fd75e5ca8722cbc8e93fabc2439f200a88b4ea26c766334e1cd265cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v0.9/bbz_Linux_arm64.tar.gz"
      sha256 "ef4b86458d4264232386452d5aca4329ab503ff1367d32f886e51af547d9a86f"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v0.9/bbz_Linux_x86_64.tar.gz"
      sha256 "37b2e241beb707178d754538c55f6a45c8446dd3b0db5d4392693d8a54055170"
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
