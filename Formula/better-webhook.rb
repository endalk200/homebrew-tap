# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc "Modern CLI for developing and testing webhooks"
  homepage "https://github.com/endalk200/better-webhook"
  version "3.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 "d1b61572348b571ddcc53fe6aeac8fb9c42f6773867495ab91ded2499098b165"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 "3ddbd7f6fbc85c040a961e39aa9989415acb69b5dbcd5c36eb94f6837b4e7e15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 "a8218000d40db731b8af4bf34450bd1bf5eb708bda3446a62f15471ce0c9a257"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 "345207a03b7f6fcf1596d4ce12712db9481463bca784c951a598b23a90020348"
    end
  end

  def install
    bin.install Dir["*"].first => "better-webhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
