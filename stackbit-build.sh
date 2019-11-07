#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc470c78ed28c001960ae6a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc470c78ed28c001960ae6a
curl -s -X POST https://api.stackbit.com/project/5dc470c78ed28c001960ae6a/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dc470c78ed28c001960ae6a/webhook/build/publish > /dev/null
