class IzCpm < Formula
  desc "CP/M 2.2 environment emulator for Z80 and 8080 binaries"
  homepage "https://github.com/ivanizag/iz-cpm"
  version "1.4.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/ivanizag/iz-cpm/releases/download/v1.4.0/iz-cpm-macos-arm64-v1.4.0.tar.gz"
      sha256 "d5678ba2e2f40aa3a53cb4d0af9bf1ab097fca06fef057248ddd595f6dc4a41f"
    end
    on_intel do
      url "https://github.com/ivanizag/iz-cpm/releases/download/v1.4.0/iz-cpm-macos-x86_64-v1.4.0.tar.gz"
      sha256 "59093fad9d8b56c881c9a63c8d4f1a0457ea69fdccfd401e1105c1ace413706b"
    end
  end

  def install
    bin.install "iz-cpm"
  end

  test do
    assert_match "CP/M 2.2", shell_output("#{bin}/iz-cpm --help")
  end
end
