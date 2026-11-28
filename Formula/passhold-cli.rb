class PassholdCli < Formula
  desc "Password manager in a terminal: secrets for scripts and an SSH agent"
  homepage "https://keyrook.com/passhold/"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.4.0/passhold-0.4.0-macos-arm64.tar.gz"
      sha256 "82947d1f910974cd399235f7ea95ea768f823d9608a1077c09b375c56735a23a"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.4.0/passhold-0.4.0-macos-x64.tar.gz"
      sha256 "5ab30cfcf42dd41a9ffcfc1311d69ded7aa8a081541bcf296778052402c4eca2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.4.0/passhold-0.4.0-linux-arm64.tar.gz"
      sha256 "e39abe488bb7437eff801ea235582bcf2c1cb96375fc2ad94a1bd323630304af"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.4.0/passhold-0.4.0-linux-x64.tar.gz"
      sha256 "95939694ebe03c376c61976da6e5bc3e3d1f409e1c9ec6d4a17bf0e6ae6db50d"
    end
  end

  def install
    bin.install "passhold"
    # The program is Node.js's too, whose licence goes with every copy.
    prefix.install "LICENSE", "LICENSE.node.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/passhold --version")
    assert_match(/^.{32}$/, shell_output("#{bin}/passhold generate --length 32").strip)
  end
end
