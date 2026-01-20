# typed: false
# frozen_string_literal: true

# Homebrew formula for better-webhook CLI
# Auto-updated by update-better-webhook workflow
class BetterWebhook < Formula
  desc "Type-safe webhook handling CLI for development and testing"
  homepage "https://github.com/endalk200/better-webhook"
  version "3.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-arm64"
      sha256 "efcc466e96e337394ea4a72ea1784b9b49210b73d01522c1b6aa662655b39d1d"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-darwin-x64"
      sha256 "81c2e1465ac8c13c7659a21a80abf12ab627ff335cc27223bddf172a40319ec4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-arm64"
      sha256 "f0d9ac13e3ea20e17be68ab1b17ab9655e686da2739eef04ed2dee63e84ef762"
    end
    on_intel do
      url "https://github.com/endalk200/better-webhook/releases/download/%40better-webhook%2Fcli%40#{version}/better-webhook-linux-x64"
      sha256 "a12e0962e368d1b63d97891eae72e4396bb591e75900a0c8f3c3bf3621098f71"
    end
  end

  def install
    bin.install Dir["*"].first => "better-webhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/better-webhook --version")
  end
end
