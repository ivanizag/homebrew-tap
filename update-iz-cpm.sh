#!/bin/bash
# Rewrites Formula/iz-cpm.rb for a published release.
# Usage: ./update.sh 1.4.0
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/iz-cpm/releases/download/v$version"

sha() {
    local tmp
    tmp=$(mktemp)
    if ! curl -sfL "$base/iz-cpm-$1-v$version.tar.gz" -o "$tmp"; then
        rm -f "$tmp"
        echo "Cannot download iz-cpm-$1-v$version.tar.gz from $base" >&2
        exit 1
    fi
    shasum -a 256 "$tmp" | cut -d' ' -f1
    rm -f "$tmp"
}

sha_arm=$(sha macos-arm64)
sha_intel=$(sha macos-x86_64)

cat > Formula/iz-cpm.rb <<EOF
class IzCpm < Formula
  desc "CP/M 2.2 environment emulator for Z80 and 8080 binaries"
  homepage "https://github.com/ivanizag/iz-cpm"
  version "$version"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "$base/iz-cpm-macos-arm64-v$version.tar.gz"
      sha256 "$sha_arm"
    end
    on_intel do
      url "$base/iz-cpm-macos-x86_64-v$version.tar.gz"
      sha256 "$sha_intel"
    end
  end

  def install
    bin.install "iz-cpm"
  end

  test do
    assert_match "CP/M 2.2", shell_output("#{bin}/iz-cpm --help")
  end
end
EOF

echo "Formula/iz-cpm.rb updated to $version"
