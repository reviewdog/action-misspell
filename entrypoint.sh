#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

misspell -locale="${INPUT_LOCALE}" . \
  | reviewdog -efm="%f:%l:%c: %m" -name="misspell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
