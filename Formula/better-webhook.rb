# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc "A modern CLI tool for webhook development, testing, and debugging. Capture incoming webhooks, replay them against your local server, manage reusable templates, and generate provider-specific signatures automatically."
  homepage "https://github.com/endalk200/better-webhook"
  version "3.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 "6119137b1af676d65595f8756ce5f7e1ca00332ebc70b9f59e2762eeb3c6edcd"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 "47ef9bdbfb5fbd794f25a0b04c31ca9a53e9ac1483ab87777febde3ed4a01710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 "e2eda6942e5c665496c80f9b35889faaa3b59a5d0dec8e3b29f0edbd76826d5b"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 "3e446d031f574412ab08bbcae4be02752db775d9c7d119ece1b3f10f4de6063d"
    end
  end

  def install
    bin.install Dir["*"].first => "better-webhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
