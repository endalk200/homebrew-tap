# typed: false
# frozen_string_literal: true

cask "better-webhook" do
  arch arm: "arm64", intel: "x64"

  version "3.10.1"
  sha256 arm: "d1b61572348b571ddcc53fe6aeac8fb9c42f6773867495ab91ded2499098b165",
         intel: "3ddbd7f6fbc85c040a961e39aa9989415acb69b5dbcd5c36eb94f6837b4e7e15"

  url "https://github.com/endalk200/better-webhook/releases/download/v#{version}/better-webhook-darwin-#{arch}"
  name "better-webhook"
  desc "Modern CLI for developing and testing webhooks"
  homepage "https://github.com/endalk200/better-webhook"

  binary "better-webhook-darwin-#{arch}", target: "better-webhook"
end
