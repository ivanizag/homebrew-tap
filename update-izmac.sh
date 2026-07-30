#!/bin/bash
# Rewrites Formula/izmac.rb for a published release.
# Usage: ./update-izmac.sh 1.0.0
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/izmac/releases/download/v$version"

sha() {
    local tmp
    tmp=$(mktemp)
    if ! curl -sfL "$base/izmac-macos-universal.tar.gz" -o "$tmp"; then
        rm -f "$tmp"
        echo "Cannot download izmac-macos-universal.tar.gz from $base" >&2
        exit 1
    fi
    shasum -a 256 "$tmp" | cut -d' ' -f1
    rm -f "$tmp"
}

sha=$(sha)

cat > Formula/izmac.rb <<EOF
class Izmac < Formula
  desc "Macintosh Plus emulator"
  homepage "https://github.com/ivanizag/izmac"
  url "$base/izmac-macos-universal.tar.gz"
  sha256 "$sha"
  license "MIT"

  def install
    bin.install "izmac"
  end

  test do
    output = shell_output("#{bin}/izmac -h 2>&1")
    assert_match "Usage of", output
  end
end
EOF

echo "Formula/izmac.rb updated to $version"
