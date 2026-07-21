#!/bin/bash
# Rewrites Formula/izapplebasic.rb for a published release.
# Usage: ./update-izapplebasic.sh 0.1
set -e
cd "$(dirname "$0")"

version=$1
if [ -z "$version" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi
base="https://github.com/ivanizag/izapplebasic/releases/download/v$version"

sha() {
    local tmp
    tmp=$(mktemp)
    if ! curl -sfL "$base/izapplebasic_$1.tar.gz" -o "$tmp"; then
        rm -f "$tmp"
        echo "Cannot download izapplebasic_$1.tar.gz from $base" >&2
        exit 1
    fi
    shasum -a 256 "$tmp" | cut -d' ' -f1
    rm -f "$tmp"
}

sha_mac_arm=$(sha Darwin_arm64)
sha_mac_intel=$(sha Darwin_x86_64)
sha_linux_arm=$(sha Linux_arm64)
sha_linux_intel=$(sha Linux_x86_64)

cat > Formula/izapplebasic.rb <<EOF
class Izapplebasic < Formula
  desc "Run the unmodified Apple II+ Applesoft BASIC ROM as a console application"
  homepage "https://github.com/ivanizag/izapplebasic"
  version "$version"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "$base/izapplebasic_Darwin_arm64.tar.gz"
      sha256 "$sha_mac_arm"
    end
    on_intel do
      url "$base/izapplebasic_Darwin_x86_64.tar.gz"
      sha256 "$sha_mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$base/izapplebasic_Linux_arm64.tar.gz"
      sha256 "$sha_linux_arm"
    end
    on_intel do
      url "$base/izapplebasic_Linux_x86_64.tar.gz"
      sha256 "$sha_linux_intel"
    end
  end

  def install
    bin.install "izapplebasic"
  end

  test do
    output = shell_output("#{bin}/izapplebasic -h 2>&1")
    assert_match "Usage", output
  end
end
EOF

echo "Formula/izapplebasic.rb updated to $version"
