#!/bin/bash
# Rewrites Formula/izpet.rb for a published release.
# Usage: ./update-izpet.sh 1.0.0
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/izpet/releases/download/v$version"

sha() {
    local tmp
    tmp=$(mktemp)
    if ! curl -sfL "$base/izpet-macos-universal.tar.gz" -o "$tmp"; then
        rm -f "$tmp"
        echo "Cannot download izpet-macos-universal.tar.gz from $base" >&2
        exit 1
    fi
    shasum -a 256 "$tmp" | cut -d' ' -f1
    rm -f "$tmp"
}

sha=$(sha)

cat > Formula/izpet.rb <<EOF
class Izpet < Formula
  desc "Commodore PET emulator"
  homepage "https://github.com/ivanizag/izpet"
  url "$base/izpet-macos-universal.tar.gz"
  sha256 "$sha"
  license "MIT"

  def install
    bin.install "izpet"
  end

  test do
    output = shell_output("#{bin}/izpet -h 2>&1")
    assert_match "Usage of", output
  end
end
EOF

echo "Formula/izpet.rb updated to $version"
