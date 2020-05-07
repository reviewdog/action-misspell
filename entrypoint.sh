#!/bin/sh

cd "$GITHUB_WORKSPACE" || exit 1

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

find "${INPUT_PATH:-'.'}" -not -path "${INPUT_EXCLUDE}" -type f -name "${INPUT_PATTERN:-'*'}" -print0 \
    | xargs -0 misspell -locale="${INPUT_LOCALE}" -i "${INPUT_IGNORE}" \
    | reviewdog -efm="%f:%l:%c: %m" -name="misspell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
