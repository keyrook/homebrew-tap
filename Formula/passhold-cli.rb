class PassholdCli < Formula
  desc "Password manager in a terminal: secrets for scripts and an SSH agent"
  homepage "https://keyrook.com/passhold/"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.3.0/passhold-0.3.0-macos-arm64.tar.gz"
      sha256 "27ea38276f920dd8f71d2280470f250f8e29867003f607f2ef8dab31a0160cd9"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.3.0/passhold-0.3.0-macos-x64.tar.gz"
      sha256 "0ffcc88192a1c79f9061e40c1b9997555cae27c13e702cad66aa5ec647ad8f0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.3.0/passhold-0.3.0-linux-arm64.tar.gz"
      sha256 "57b3ff81552da48df0a2c147ef880718149bc2892ad37a76e425027df0dcf20e"
    end
    on_intel do
      url "https://github.com/keyrook/passhold/releases/download/cli-v0.3.0/passhold-0.3.0-linux-x64.tar.gz"
      sha256 "295f9d0cbfa09267f0fec80c626ea51e1dc6b1a69345fd6b04f0117cb6b4a950"
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
