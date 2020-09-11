#!/usr/bin/env bash

set -o errexit

OUTDIR=docs/modules/api/pages/

if [ ! -d node_modules ]; then
  npm ci
fi

rm -rf "$OUTDIR"
solidity-docgen --solc-module solc-0.6.8 -t docs -o "$OUTDIR" -e contracts/mocks,contracts/examples --output-structure readmes
node scripts/gen-nav.js "$OUTDIR" > "$OUTDIR/../nav.adoc"
