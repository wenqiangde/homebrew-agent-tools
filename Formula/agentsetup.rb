class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.3/agentsetup-v4.1.3-darwin-arm64"
      sha256 "19de3792aadbf3e891d62f3a9c3c528d42421fc5f0df6518871e988f4b0e6cfb"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.3/agentsetup-v4.1.3-darwin-amd64"
      sha256 "879817a73c4df7a15a4c32ad3f2b24a030f2ae035250cc40f05e30c1e07ffbce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.3/agentsetup-v4.1.3-linux-arm64"
      sha256 "22d703dffa6bca3932213eff7d2f64524e3d91c2a51b5db46ebb52cc281ca655"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.3/agentsetup-v4.1.3-linux-amd64"
      sha256 "99dbccabd68a120e4e61c3ca7b5da1a35983ebc000104eb892418dab0dc213de"
    end
  end

  def install
    bin.install Dir["agentsetup-*"].first => "agentsetup"
    chmod 0755, bin/"agentsetup"
    generate_completions_from_executable(bin/"agentsetup", "completion")
  end

  test do
    assert_match "AgentSetup Version", shell_output("#{bin}/agentsetup version")
    assert_match "#compdef agentsetup", shell_output("#{bin}/agentsetup completion zsh")
  end
end
