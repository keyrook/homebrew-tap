class PassholdCli < Formula
  desc "Password manager in a terminal: secrets for scripts and an SSH agent"
  homepage "https://keyrook.com/passhold/"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.2.0/passhold-0.2.0-macos-arm64.tar.gz"
      sha256 "810d0eb995f8ab7c15689905c6a1378b2dac09966fcf3163997ea1478cce7688"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.2.0/passhold-0.2.0-macos-x64.tar.gz"
      sha256 "4dea4ea9e456bad12d5966174d0688fa75a082f46ec9776bf801232147125d39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.2.0/passhold-0.2.0-linux-arm64.tar.gz"
      sha256 "e480509cc7264114bd5a594894daa8f32ca31b76fca6f504c4209dfef6d7996b"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.2.0/passhold-0.2.0-linux-x64.tar.gz"
      sha256 "e635edd72ec06bde454ad11f2cfdfd601043a6e5718156a95967ef021e2b7945"
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
