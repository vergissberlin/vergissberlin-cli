# Contributing to VergissBerlin CLI

Thank you for your interest in the VergissBerlin CLI project! Here you'll find information on how to contribute to the project and create local releases.

## Setting up Development Environment

### Prerequisites
- Ruby (version 3.2 or higher)
- Bundler
- Git

### Installation
```bash
# Clone repository
git clone https://github.com/vergissberlin/vergissberlin-cli.git
cd vergissberlin-cli

# Install dependencies
bundle install
```

## Running Tests

```bash
# Run all tests
bundle exec rake test

# Run tests with coverage
bundle exec rake coveralls:push
```

## Creating Local Releases

### 1. Update Version

Edit the file `lib/vergissberlin/version.rb` and update the version number:

```ruby
module Vergissberlin
  VERSION = "1.0.0"  # Enter new version number here
end
```

### 2. Commit Changes

```bash
# Stage and commit changes
git add .
git commit -m "Bump version to 1.0.0"
```

### 3. Create Tag

```bash
# Create Git tag
git tag v1.0.0

# Push tag
git push origin v1.0.0
```

### 4. Build and Test Gem Locally

```bash
# Build gem
gem build vergissberlin.gemspec

# Install gem locally and test
gem install vergissberlin-1.0.0.gem

# Test if CLI works
vergissberlin --help
```

### 5. Trigger Release

**Option A: Automatic Release (recommended)**
After pushing the tag, the GitHub Action will automatically trigger and publish the gem to RubyGems.

**Option B: Create GitHub Release**
1. Go to [GitHub Releases](https://github.com/vergissberlin/vergissberlin-cli/releases)
2. Click "Create a new release"
3. Select the created tag (e.g., `v1.0.0`)
4. Add release notes
5. Click "Publish release"

The GitHub Action will automatically publish the gem to RubyGems.

## Publishing Release to RubyGems (Manual)

If you want to publish the gem manually:

```bash
# Build gem
gem build vergissberlin.gemspec

# Publish to RubyGems
gem push vergissberlin-1.0.0.gem
```

**Note**: You need a RubyGems account and API key for manual publishing.

## Contributing Guidelines

### Code Style
- Use 2 spaces for indentation
- Write meaningful commit messages
- Add tests for new features

### Pull Request Process
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request

### Issue Reporting
- Use the issue templates
- Describe the problem clearly and completely
- Add steps to reproduce

## Versioning

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR** version for incompatible API changes
- **MINOR** version for new features (backward compatible)
- **PATCH** version for bug fixes (backward compatible)

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.
