# Contributing to Vergissberlin CLI

Thank you for your interest in contributing! This document covers local setup, testing, and the automated release flow.

## Setting up the Development Environment

### Prerequisites

- Ruby 3.2 or higher
- Bundler
- Git

### Installation

```bash
git clone https://github.com/vergissberlin/vergissberlin-cli.git
cd vergissberlin-cli
bundle install
```

## Running Tests

```bash
bundle exec rake test
```

Coverage (SimpleCov HTML + LCOV) is generated under `coverage/`. CI uploads LCOV to Coveralls via `coverallsapp/github-action`.

## Project Layout

- `lib/vergissberlin/` – gem code (`CLI`, `VERSION`, …)
- `bin/vergissberlin` – thin executable wrapper
- `test/` – Minitest suite
- `.github/workflows/` – CI and Release Please

## Releases with Release Please

Version bumps, `CHANGELOG.md`, and GitHub releases are handled by [Release Please](https://github.com/googleapis/release-please).

### How it works

1. Land changes on `main` using Conventional Commits
2. Release Please opens or updates a release PR
3. Merge the release PR to cut a tagged GitHub release
4. `.github/workflows/release.yml` builds and pushes the gem to RubyGems

You usually do **not** edit `lib/vergissberlin/version.rb` by hand.

### Conventional Commits

All commit messages must be written in English.

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`.

Examples:

```bash
git commit -m "feat: add version command to CLI"
git commit -m "fix: resolve bundler dependency issue"
git commit -m "docs: update installation instructions"
```

Breaking changes:

```bash
git commit -m "feat!: change CLI interface to use subcommands

BREAKING CHANGE: The CLI now requires subcommands instead of flags"
```

### RubyGems API Key (CI)

For automatic publishing, add a repository secret named `RUBYGEMS_API_KEY`:

1. Create an API key on [RubyGems.org](https://rubygems.org)
2. In the GitHub repo: Settings → Secrets and variables → Actions
3. Add `RUBYGEMS_API_KEY` with the generated key

Never commit API keys. Rotate them regularly and limit permissions.

### Manual publish (fallback)

```bash
gem build vergissberlin.gemspec
gem push vergissberlin-*.gem
```

## Code Style

- 2 spaces for indentation
- Conventional Commits for messages
- Add tests for new behavior
- Keep documentation in English

## Pull Request Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit with Conventional Commits
4. Push and open a Pull Request

## Versioning

We follow [Semantic Versioning](https://semver.org/). Before `1.0.0`, Release Please is configured with `bump-minor-pre-major` and `bump-patch-for-minor-pre-major`.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
