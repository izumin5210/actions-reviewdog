#!/usr/bin/env bash

set -euo pipefail

echo "--> Setup env"
export CI_PULL_REQUEST=$(cat $GITHUB_EVENT_PATH | jq -r .number)
export CI_COMMIT=$GITHUB_SHA
export CI_REPO_OWNER=$(cat $GITHUB_EVENT_PATH | jq -r .repository.owner.login)
export CI_REPO_NAME=$(cat $GITHUB_EVENT_PATH | jq -r .repository.name)
export CI_BRANCH=$(cat $GITHUB_EVENT_PATH | jq -r .pull_request.head.ref)
export REVIEWDOG_GITHUB_API_TOKEN=$GITHUB_TOKEN
export PATH=$(pwd)/bin:$PATH
env | grep CI_ | sort

echo "--> Download dependencies"
go mod download

echo "--> Build tools"
gex --build

echo "--> Run reviewdog"
reviewdog -reporter=github-pr-review
