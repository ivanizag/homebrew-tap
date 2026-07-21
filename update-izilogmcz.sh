#!/bin/bash
# Rewrites Formula/izilogmcz.rb for a published release.
# Usage: ./update-izilogmcz.sh 1.4.0
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/izilogmcz/releases/download/v$version"

sha() {
    local tmp
    tmp=$(mktemp)
    if ! curl -sfL "$base/izilogmcz-$1-v$version.tar.gz" -o "$tmp"; then
        rm -f "$tmp"
        echo "Cannot download izilogmcz-$1-v$version.tar.gz from $base" >&2
        exit 1
    fi
    shasum -a 256 "$tmp" | cut -d' ' -f1
    rm -f "$tmp"
}

sha_arm=$(sha macos-arm64)
sha_intel=$(sha macos-x86_64)

cat > Formula/izilogmcz.rb <<EOF
class Izilogmcz < Formula
  desc "Emulator of the Zilog MCZ-1 computer"
  homepage "https://github.com/ivanizag/izilogmcz"
  version "$version"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "$base/izilogmcz-macos-arm64-v$version.tar.gz"
      sha256 "$sha_arm"
    end
    on_intel do
      url "$base/izilogmcz-macos-x86_64-v$version.tar.gz"
      sha256 "$sha_intel"
    end
  end

  def install
    bin.install "izilogmcz"
  end

  test do
    assert_match "MCZ-1", shell_output("#{bin}/izilogmcz --help")
  end
end
EOF

echo "Formula/izilogmcz.rb updated to $version"
