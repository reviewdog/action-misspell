#!/bin/sh

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

if [ -z "$INPUT_FIND_COMMAND" ]; then
  misspell -locale="${INPUT_LOCALE}" . \
    | reviewdog -efm="%f:%l:%c: %m" -name="misspell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
else
  eval $INPUT_FIND_COMMAND \
    | xargs misspell -locale="${INPUT_LOCALE}" \
    | reviewdog -efm="%f:%l:%c: %m" -name="misspell" -reporter="${INPUT_REPORTER:-github-pr-check}" -level="${INPUT_LEVEL}"
fi
