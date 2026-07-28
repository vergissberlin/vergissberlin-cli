# Vergissberlin

Some hot useless stuff! Trust me, there is no functionality.

[![CI](https://github.com/vergissberlin/vergissberlin-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/vergissberlin/vergissberlin-cli/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/vergissberlin.svg)](https://badge.fury.io/rb/vergissberlin)
[![Coverage Status](https://coveralls.io/repos/github/vergissberlin/vergissberlin-cli/badge.svg?branch=main)](https://coveralls.io/github/vergissberlin/vergissberlin-cli?branch=main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.txt)

## Installation

### For End Users

Add this line to your application's Gemfile:

```ruby
gem "vergissberlin"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install vergissberlin
```

### For Developers

```bash
git clone https://github.com/vergissberlin/vergissberlin-cli.git
cd vergissberlin-cli
bundle install
bundle exec rake test
bundle exec vergissberlin --help
```

Ruby 3.2+ is required.

## Usage

```bash
vergissberlin          # print the useless banner
vergissberlin --version
vergissberlin --help
```

## Development

```bash
bundle install
bundle exec rake test
```

Coverage reports are written to `coverage/` (HTML + LCOV). CI uploads LCOV to Coveralls.

## Release

Releases are automated with [Release Please](https://github.com/googleapis/release-please).

1. Merge conventional commits into `main`
2. Release Please opens (or updates) a release PR with changelog + version bump
3. Merging that PR creates a GitHub release/tag
4. The release workflow publishes the gem to RubyGems

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Contributing

Bug reports and pull requests are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and use [Conventional Commits](https://www.conventionalcommits.org/).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).
