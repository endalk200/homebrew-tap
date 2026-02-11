# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc "Modern CLI for developing and testing webhooks"
  homepage "https://github.com/endalk200/better-webhook"
  version "3.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 "a05c8801f0d8d76d1f12982d36b3f85cfcf6970b59092ed9d86ae240a0b5db9f"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 "8bcc5f1c6bd4c63a21a5a0fdd648f45149f50fce1e0e40732f6a7345a54bf677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 "7695da1349e961f975976c2c808b5c9ddd1428d5f0529a1fbcb1d35ded4b0d2c"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 "441e3aa5beb7ebb4c5e2728e376c7240262085e0b1b1bc1199fd356fa128a3e4"
    end
  end

  def install
    bin.install Dir["*"].first => "better-webhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
