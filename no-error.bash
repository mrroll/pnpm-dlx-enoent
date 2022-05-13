#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

IFS=$'\n\t'

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd ${__DIR}

rm -r "${__DIR}/pnpm-lock.yaml" || true
rm -r "${__DIR}/node_modules" || true
rm -r "${__DIR}/.npmrc" || true

pnpm install

pnpm dlx cloc "${__DIR}/backend"
