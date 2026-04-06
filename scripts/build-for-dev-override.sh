#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${ROOT}/.dev-overrides"
mkdir -p "${OUT}"
cd "${ROOT}"
# Version suffix must satisfy required_providers (e.g. ~> 0.13); dev_override uses this binary.
go build -ldflags="-X main.version=0.13.99+appmatter" -o "${OUT}/terraform-provider-neon_v0.13.99" .
echo "Built ${OUT}/terraform-provider-neon_v0.13.99"
