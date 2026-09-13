class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.0/agentsetup-v4.1.0-darwin-arm64"
      sha256 "9fc0145df25cccf61d85e20305739f49822eea1c0906f8806441c1359e0233b7"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.0/agentsetup-v4.1.0-darwin-amd64"
      sha256 "09ba619a96d191cce2f545bc394b03b936dfa35b32ae5aec704106852c95ec55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.0/agentsetup-v4.1.0-linux-arm64"
      sha256 "64413cf188825910b65f1aae0ce4240a5a6ff28dd15ee2debc35188b82448780"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.0/agentsetup-v4.1.0-linux-amd64"
      sha256 "2d8080af439ab3f78ce1f36bb14b97a919e79e01c6f3d640afe421839e3b05da"
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
