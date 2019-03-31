#!/usr/bin/env bash

set -euo pipefail

go mod download
gex --build
REVIEWDOG_GITHUB_API_TOKEN=GITHUB_TOKEN reviewdog -reporter=github-pr-review
