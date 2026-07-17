#!/bin/bash
# Rewrites Formula/izapple2.rb for a published release.
# Usage: ./update-izapple2.sh 1.4.0
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/izapple2/releases/download/v$version"

sha=$(curl -sfL "$base/izapple2-macos-universal.tar.gz" | shasum -a 256 | cut -d' ' -f1)

cat > Formula/izapple2.rb <<EOF
class Izapple2 < Formula
  desc "Apple ][+ and //e emulator"
  homepage "https://github.com/ivanizag/izapple2"
  url "$base/izapple2-macos-universal.tar.gz"
  sha256 "$sha"
  license "GPL-3.0-only"

  def install
    bin.install "izapple2"
  end

  test do
    output = shell_output("#{bin}/izapple2 -h 2>&1")
    assert_match "Usage:", output
  end
end
EOF

echo "Formula/izapple2.rb updated to $version"
