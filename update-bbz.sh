#!/bin/bash
# Rewrites Formula/bbz.rb for a published release.
# Usage: ./update-bbz.sh 0.10
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/bbz/releases/download/v$version"

sha() {
    curl -sfL "$base/bbz_$1.tar.gz" | shasum -a 256 | cut -d' ' -f1
}

sha_mac_arm=$(sha Darwin_arm64)
sha_mac_intel=$(sha Darwin_x86_64)
sha_linux_arm=$(sha Linux_arm64)
sha_linux_intel=$(sha Linux_x86_64)

cat > Formula/bbz.rb <<EOF
class Bbz < Formula
  desc "Run 6502 programs using the Acorn MOS on a modern operating system as a console application"
  homepage "https://github.com/ivanizag/bbz"
  version "$version"
  license "MIT"

  on_macos do
    on_arm do
      url "$base/bbz_Darwin_arm64.tar.gz"
      sha256 "$sha_mac_arm"
    end
    on_intel do
      url "$base/bbz_Darwin_x86_64.tar.gz"
      sha256 "$sha_mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$base/bbz_Linux_arm64.tar.gz"
      sha256 "$sha_linux_arm"
    end
    on_intel do
      url "$base/bbz_Linux_x86_64.tar.gz"
      sha256 "$sha_linux_intel"
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
EOF

echo "Formula/bbz.rb updated to $version"
