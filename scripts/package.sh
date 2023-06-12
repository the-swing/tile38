#!/bin/bash

set -e
cd $(dirname "${BASH_SOURCE[0]}")/..

PLATFORM="$1"
GOOS="$2"
GOARCH="$3"
VERSION="1.31.0"

echo Packaging $PLATFORM Binary

# Remove previous build directory, if needed.
bdir=tile38-$VERSION-$GOOS-$GOARCH
rm -rf packages/$bdir && mkdir -p packages/$bdir

# Make the binaries.
GOOS=$GOOS GOARCH=$GOARCH make all
rm -f tile38-luamemtest # not needed

# Copy the executable binaries.
if [ "$GOOS" == "windows" ]; then
	mv tile38-server packages/$bdir/tile38-server.exe
	mv tile38-cli packages/$bdir/tile38-cli.exe
	mv tile38-benchmark packages/$bdir/tile38-benchmark.exe
else
	mv tile38-server packages/$bdir
	mv tile38-cli packages/$bdir
	mv tile38-benchmark packages/$bdir
fi

# Copy documention and license.
cp README.md packages/$bdir
cp CHANGELOG.md packages/$bdir
cp LICENSE packages/$bdir

# Compress the package.
cd packages
if [ "$GOOS" == "linux" ]; then
	tar -zcf $bdir.tar.gz $bdir
else
	zip -r -q $bdir.zip $bdir
fi

