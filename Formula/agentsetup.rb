class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.5/agentsetup-v4.1.5-darwin-arm64"
      sha256 "653548f40ec186c6da6dd1c600387c967962c6b46158f3d719b7762d4bfe8c8a"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.5/agentsetup-v4.1.5-darwin-amd64"
      sha256 "aa0ef2d5072f82ce25b6d68c419dfdebdc9fcfe71406ea5fe5d3a8f184a7d9d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.5/agentsetup-v4.1.5-linux-arm64"
      sha256 "11b91adb2e5be7e9b8404a458a621f8e7fcbcb6d5afec9e07b32b584822b7a7b"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.5/agentsetup-v4.1.5-linux-amd64"
      sha256 "c569d260c29b82d3b3dd4cc1940181f3877543628a19bca80d4475d50daf6c3d"
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
