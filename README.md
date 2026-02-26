# Homebrew Tap

Personal Homebrew tap for CLI tools and applications by [@endalk200](https://github.com/endalk200).

## Installation

```bash
brew tap endalk200/tap
```

Install directly without manually tapping first:

```bash
# Formula
brew install endalk200/tap/lazygit-endalk

# Cask
brew install --cask endalk200/tap/better-webhook
```

## Available Packages

### Formulae (sorted)

| Formula                                                | Description                                       |
| ------------------------------------------------------ | ------------------------------------------------- |
| [lazygit-endalk](https://github.com/endalk200/lazygit) | Simple terminal UI for git commands (endalk fork) |

### Casks (sorted)

| Cask                                                          | Description                                    |
| ------------------------------------------------------------- | ---------------------------------------------- |
| [better-webhook](https://github.com/endalk200/better-webhook) | Modern CLI for developing and testing webhooks |

## Package Notes

### lazygit-endalk

Personal fork of [lazygit](https://github.com/jesseduffield/lazygit) with extra features that are not intended for upstream.

- AI-powered commit message generation that is provider-agnostic

### better-webhook

CLI for webhook development, testing, and debugging.

- Capture incoming webhooks from any provider
- Replay captured webhooks to local endpoints
- Auto-generate signatures for Stripe, GitHub, Shopify, Slack, and more

## better-webhook Release Flow

- `better-webhook` releases update `Casks/better-webhook.rb` through a PR created by GoReleaser.
- `main` should only be updated through PRs with required checks passing.
- `brew test-bot` is the merge gate for syntax/style validity.
- Auto-merge is restricted to trusted bot PRs that only touch `Casks/better-webhook.rb`.
- If CI fails with `Cask/StanzaOrder` or `Cask/StanzaGrouping`, fix style in the PR and merge only after checks are green.

## Adding a New Formula

### Quick Start

1. Create a new branch
2. Add your formula to `Formula/<name>.rb`
3. Test locally: `brew install --build-from-source Formula/<name>.rb`
4. Open a PR
5. Wait for CI to build bottles
6. Add the `pr-pull` label to publish

### Using brew create

```bash
# For a source tarball
brew create https://github.com/user/tool/archive/v1.0.0.tar.gz \
  --tap endalk200/tap \
  --set-name mytool

# Test locally
brew install --build-from-source endalk200/tap/mytool
```

### Formula Templates

#### Go Binary

```ruby
class Mytool < Formula
  desc "Description of your tool"
  homepage "https://github.com/endalk200/mytool"
  url "https://github.com/endalk200/mytool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mytool --version")
  end
end
```

#### Rust Binary

```ruby
class Mytool < Formula
  desc "Description of your tool"
  homepage "https://github.com/endalk200/mytool"
  url "https://github.com/endalk200/mytool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mytool --version")
  end
end
```

#### Pre-built Binary (GitHub Releases)

```ruby
class Mytool < Formula
  desc "Description of your tool"
  homepage "https://github.com/endalk200/mytool"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/mytool/releases/download/v#{version}/mytool-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
    end
    on_intel do
      url "https://github.com/endalk200/mytool/releases/download/v#{version}/mytool-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/mytool/releases/download/v#{version}/mytool-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
    end
    on_intel do
      url "https://github.com/endalk200/mytool/releases/download/v#{version}/mytool-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum
    end
  end

  def install
    bin.install "mytool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mytool --version")
  end
end
```

## Adding a New Cask

Add your cask to `Casks/<name>.rb`:

```ruby
cask "myapp" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000" # Replace with actual checksum

  url "https://github.com/endalk200/myapp/releases/download/v#{version}/MyApp-#{version}.dmg"
  name "MyApp"
  desc "Description of your app"
  homepage "https://github.com/endalk200/myapp"

  app "MyApp.app"

  zap trash: [
    "~/Library/Application Support/MyApp",
    "~/Library/Preferences/com.endalk200.myapp.plist",
  ]
end
```

## How Bottles Work

When you open a PR:

1. GitHub Actions runs `brew test-bot` to lint and test your formula
2. Bottles (precompiled binaries) are built for macOS Intel, Apple Silicon, and Linux
3. Bottles are uploaded as artifacts
4. When you add the `pr-pull` label, bottles are published to GitHub Releases
5. Users get fast installs from precompiled bottles

## Useful Commands

```bash
# Get SHA256 of a file
curl -L <URL> | shasum -a 256

# Audit your formula
brew audit --strict --online endalk200/tap/<formula>

# Test your formula
brew test endalk200/tap/<formula>

# Check formula style
brew style endalk200/tap/<formula>
```

## License

MIT
