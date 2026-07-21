class Izilogmcz < Formula
  desc "Emulator of the Zilog MCZ-1 computer"
  homepage "https://github.com/ivanizag/izilogmcz"
  version "0.5.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/izilogmcz/releases/download/v0.5.0/izilogmcz-macos-arm64-v0.5.0.tar.gz"
      sha256 "db57d76bb7f7044432bb15a1d10b23e1fbb79043c460db4d8940cf48771e190b"
    end
    on_intel do
      url "https://github.com/ivanizag/izilogmcz/releases/download/v0.5.0/izilogmcz-macos-x86_64-v0.5.0.tar.gz"
      sha256 "c1b3f7019725c64d846c3e2be63369e6af34a6efea7dd9fb81519e54ede63e46"
    end
  end

  def install
    bin.install "izilogmcz"
  end

  test do
    assert_match "MCZ-1", shell_output("#{bin}/izilogmcz --help")
  end
end
