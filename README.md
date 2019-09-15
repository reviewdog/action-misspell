# GitHub Action: Run misspell with reviewdog

[![Docker Image CI](https://github.com/reviewdog/action-misspell/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/reviewdog/action-misspell/actions)
[![Release](https://img.shields.io/github/release/reviewdog/action-misspell.svg?maxAge=43200)](https://github.com/reviewdog/action-misspell/releases)

This action runs [misspell](https://github.com/client9/misspell) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `locale`

Optional. -locale flag of misspell. (US/UK)

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

## Example usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yml
name: reviewdog
on: [pull_request]
jobs:
  misspell:
    name: runner / misspell
    runs-on: ubuntu-latest
    steps:
      - name: Check out code.
        uses: actions/checkout@v1
      - name: misspell
        uses: reviewdog/action-misspell@v1
        with:
          github_token: ${{ secrets.github_token }}
          locale: "US"
```
