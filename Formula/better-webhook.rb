# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc 'A modern CLI tool for webhook development, testing, and debugging. Capture incoming webhooks, replay them against your local server, manage reusable templates, and generate provider-specific signatures automatically.'
  homepage 'https://github.com/endalk200/better-webhook'
  version '0.0.0'
  license 'MIT'

  # Placeholder - will be updated by CI when first release is available
  # To trigger an update manually, run:
  #   gh workflow run update-better-webhook.yml --repo endalk200/homebrew-tap

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
  end

  def install
    bin.install Dir['*'].first => 'better-webhook'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
