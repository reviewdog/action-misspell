#!/bin/sh

cd "$GITHUB_WORKSPACE" || exit 1

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

misspell -error -locale="${INPUT_LOCALE}" -i="${INPUT_IGNORE}" . |
  reviewdog -efm="%f:%l:%c: %m" -name="misspell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
