# typed: false
# frozen_string_literal: true

class LazygitEndalk < Formula
  desc "Simple terminal UI for git commands (endalk fork)"
  homepage "https://github.com/endalk200/lazygit"
  version "0.59.0-endalk.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/endalk200/lazygit/releases/download/v#{version}/lazygit_#{version}_darwin_arm64.tar.gz"
      sha256 "6d019bcedc09cade8b4ca497a8dc336fa83515a0302b991593e3ca0f85d04e44"
    end
    on_intel do
      url "https://github.com/endalk200/lazygit/releases/download/v#{version}/lazygit_#{version}_darwin_x86_64.tar.gz"
      sha256 "3c240963973567abc4df3a32b0da76d0d14c674da247ecd04f258e6eb4468206"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/endalk200/lazygit/releases/download/v#{version}/lazygit_#{version}_linux_arm64.tar.gz"
      sha256 "9b6ffd0024fcbaafa675831f9678ff2cc08bd49d5cd2c5915530541d60a175ae"
    end
    on_intel do
      url "https://github.com/endalk200/lazygit/releases/download/v#{version}/lazygit_#{version}_linux_x86_64.tar.gz"
      sha256 "74808b4246b1ff14d37977b36ae3d360cda0e8006659142deac5dd1b7c1bec64"
    end
  end

  def install
    bin.install "lazygit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazygit --version")
  end
end
