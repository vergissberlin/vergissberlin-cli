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

## Getting RubyGems API Key

### For GitHub Actions (Automatic Releases)

To enable automatic releases to RubyGems via GitHub Actions, you need to set up a RubyGems API key as a GitHub secret:

1. **Create RubyGems Account** (if you don't have one):
   - Go to [RubyGems.org](https://rubygems.org)
   - Click "Sign up" and create an account
   - Verify your email address

2. **Generate API Key**:
   - Log in to [RubyGems.org](https://rubygems.org)
   - Go to your profile (click your username)
   - Click "Edit Profile"
   - Scroll down to "API Access" section
   - Click "Create API Key"
   - Give it a name (e.g., "GitHub Actions")
   - Copy the generated API key (it starts with `rubygems_`)

3. **Add to GitHub Secrets**:
   - Go to your GitHub repository
   - Click "Settings" tab
   - Click "Secrets and variables" → "Actions"
   - Click "New repository secret"
   - Name: `RUBYGEMS_API_KEY`
   - Value: Paste your RubyGems API key
   - Click "Add secret"

### For Manual Publishing

If you want to publish gems manually from your local machine:

1. **Install RubyGems credentials**:
   ```bash
   gem push --key your_api_key_name
   ```

2. **Or configure credentials permanently**:
   ```bash
   gem push
   # Enter your RubyGems username and password when prompted
   ```

### Security Notes

- **Never commit API keys** to your repository
- **Use GitHub Secrets** for CI/CD pipelines
- **Rotate API keys** regularly for security
- **Limit API key permissions** to only what's needed

## Contributing Guidelines

### Code Style
- Use 2 spaces for indentation
- Use Conventional Commits for commit messages
- Add tests for new features

### Pull Request Process
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes using Conventional Commits
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request

### Issue Reporting
- Use the issue templates
- Describe the problem clearly and completely
- Add steps to reproduce

## Conventional Commits

We use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages to ensure clear and standardized communication about changes.

**Important**: All commit messages must be written in English, regardless of the language used in other project communications.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation

### Examples

```bash
# New feature
git commit -m "feat: add version command to CLI"

# Bug fix
git commit -m "fix: resolve bundler dependency issue"

# Documentation
git commit -m "docs: update installation instructions"

# Breaking change
git commit -m "feat!: change CLI interface to use subcommands

BREAKING CHANGE: The CLI now requires subcommands instead of flags"

# With scope
git commit -m "feat(cli): add --verbose flag for detailed output"

# With body
git commit -m "feat: add GitHub Actions for CI/CD

- Add CI workflow for testing
- Add release workflow for automatic publishing
- Configure Ruby 3.2+ for CI environment"
```

### Commit Message Guidelines

- **Language**: Always use English for commit messages
- **Imperative Mood**: Use "add" not "added", "fix" not "fixed"
- **Descriptive**: Be clear about what the change does
- **Concise**: Keep the first line under 50 characters
- **Consistent**: Follow the same format across all commits

### Benefits

- **Automatic changelog generation**
- **Semantic versioning automation**
- **Clear communication about changes**
- **Better code review process**
- **Integration with release tools**

## Versioning

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR** version for incompatible API changes
- **MINOR** version for new features (backward compatible)
- **PATCH** version for bug fixes (backward compatible)

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.
