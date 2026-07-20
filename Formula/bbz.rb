class Bbz < Formula
  desc "Run 6502 programs using the Acorn MOS on a modern operating system as a console application"
  homepage "https://github.com/ivanizag/bbz"
  version "1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v1.1/bbz_Darwin_arm64.tar.gz"
      sha256 "178fe1f1f2c5e56ee7d203fe893eb7ad48a2e413c0a95d5551e4bb32ad86e9c9"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v1.1/bbz_Darwin_x86_64.tar.gz"
      sha256 "8f27aa857675f4905d0ee951e110b2c5ffb50cc1f45c519af4fe46828d3551a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ivanizag/bbz/releases/download/v1.1/bbz_Linux_arm64.tar.gz"
      sha256 "7badf785fd48d7429dda893c8563d256413edabb5927b3b030dab5833868b8a1"
    end
    on_intel do
      url "https://github.com/ivanizag/bbz/releases/download/v1.1/bbz_Linux_x86_64.tar.gz"
      sha256 "f2b02f3b14f3011b232828332e66b4c1b2a9d66d752ec82f8e9cd5b007571305"
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
