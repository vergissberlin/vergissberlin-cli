# AGENTS.md

Guidance for AI coding agents working on this repository.

## Project overview

`vergissberlin` is a small Ruby CLI gem with intentionally useless features. Keep the playful “useless tool” theme in public descriptions, but treat the engineering as a serious, modern Ruby gem.

- Gem name: `vergissberlin`
- Repo: `vergissberlin/vergissberlin-cli`
- Default branch: `main`
- Ruby: `>= 3.2` (see `.ruby-version`)

## Layout

| Path | Purpose |
| --- | --- |
| `lib/vergissberlin.rb` | Public entrypoint |
| `lib/vergissberlin/cli.rb` | CLI logic (`Vergissberlin::CLI`) |
| `lib/vergissberlin/skyline.rb` | ASCII art skyline with the Fernsehturm |
| `lib/vergissberlin/reasons.rb` | German reasons to forget Berlin (random) |
| `lib/vergissberlin/version.rb` | `VERSION` constant (Release Please owned) |
| `bin/vergissberlin` | Thin executable wrapper only |
| `test/` | Minitest suite (`*_test.rb`, `test_helper.rb`) |
| `.github/workflows/ci.yml` | CI (Ruby 3.2 / 3.3 / 3.4 + Coveralls) |
| `.github/workflows/release.yml` | Release Please + RubyGems publish |
| `release-please-config.json` | Release Please package config |
| `.release-please-manifest.json` | Current released version manifest |

## Setup commands

```bash
bundle install
bundle exec rake test
bundle exec vergissberlin --help
bundle exec vergissberlin --version
```

Prefer `bundle exec` for all Ruby tooling.

## Testing

- Framework: Minitest
- Run suite: `bundle exec rake test`
- Coverage: SimpleCov (HTML + LCOV under `coverage/`)
- CI uploads LCOV via `coverallsapp/github-action`
- Add or update tests for behavior you change
- Keep the suite green before committing

## Code style

- 2-space indentation
- Prefer single-quoted strings unless interpolation/escapes are needed (Hound/RuboCop `Style/StringLiterals`)
- Keep lines within ~80 characters when practical
- Snake_case methods/vars, CamelCase classes
- Put CLI behavior in `Vergissberlin::CLI`, not in `bin/`
- Keep methods small and focused
- Documentation (README, CONTRIBUTING, comments for public APIs) must be in **English**

## Do / don’t

**Do**

- Follow Conventional Commits in English (`feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, …)
- Preserve backward-compatible CLI flags (`--help`, `--version`, default output)
- Update README/CONTRIBUTING when workflows or public behavior change
- Keep the gem lightweight

**Don’t**

- Manually bump `lib/vergissberlin/version.rb` (Release Please owns it)
- Reintroduce Coveralls Ruby gem / `sed` CI hacks / `Gemfile.production`
- Commit secrets, API keys, or `.env` credentials
- Commit `Gemfile.lock`, `coverage/`, or `vendor/bundle`
- Add heavyweight dependencies without a clear need

## Commits and PRs

```text
<type>[optional scope]: <description>
```

Examples:

```bash
git commit -m "feat(cli): add --verbose flag"
git commit -m "fix: handle invalid CLI options"
git commit -m "docs: update release please instructions"
```

- Imperative mood (“add”, not “added”)
- Run `bundle exec rake test` before push
- Prefer focused PRs over drive-by refactors unrelated to the task

## Releases

Releases are automated:

1. Land conventional commits on `main`
2. Release Please opens/updates a release PR (changelog + version bump)
3. Merging that PR creates the GitHub release/tag
4. `release.yml` publishes the gem to **RubyGems.org** (`RUBYGEMS_API_KEY`)
   and **GitHub Packages** (`GITHUB_TOKEN` + `packages: write`)

All Conventional Commit types are visible changelog sections in
`release-please-config.json` (so non-`feat`/`fix` commits can still open a
release PR). Do not create release tags by hand unless explicitly asked.

## Communication

- If the human writes in German, reply in German
- Use gender-neutral language in German
- Keep explanations concrete and short
