#!/bin/bash

echo "Building Lambda Layer for ARM64..."

docker run --rm --platform linux/arm64 \
  -v "$PWD":/var/task \
  -w /var/task \
  python:3.14 \
  /bin/bash -c "apt-get update && apt-get install -y gcc g++ build-essential && pip install -r requirements.txt -t python/"

echo "Zipping files..."
zip -r -y shared-lambda-layer-api-sfv-arm64.zip python

echo "Wiping libraries..."
rm -rf python

echo "Done! Layer created: shared-lambda-layer-api-sfv-arm64.zip"