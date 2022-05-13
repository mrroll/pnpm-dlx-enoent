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

echo 'node-linker=hoisted' >"${__DIR}/.npmrc"

pnpm install

pnpm dlx cloc "${__DIR}/backend" #  ENOENT  ENOENT: no such file or directory, open '${HOME}/.local/share/pnpm/store/v3/tmp/dlx-89251/node_modules/cloc/package.json'
