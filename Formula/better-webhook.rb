# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc "Modern CLI for developing and testing webhooks"
  homepage "https://github.com/endalk200/better-webhook"
  version "3.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 "8fc5554ebb2057573f15da12902194df5d97530531f7338c4ae1ec66e9be0ba0"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 "20a4fadb582c47ab2b943a4b0a32da9a8e92557b89988e60662818972ec0b7ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 "6621d375f3cc18d3a164de51e0a5533a8958ac31cee3a1b90b0c76aff0f6cbaa"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 "732d004a392526ba2313380bc1da30a7c79c3f753907486a406c6a99e7151699"
    end
  end

  def install
    bin.install Dir["*"].first => "better-webhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
