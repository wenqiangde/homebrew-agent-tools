class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.1/agentsetup-v4.1.1-darwin-arm64"
      sha256 "92f732fc2f10aeca089897854c42e13fc1cee2c252e48d00b2915843efed733f"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.1/agentsetup-v4.1.1-darwin-amd64"
      sha256 "4f5a716266064dacf7bc09081ed5d623f6818039fc66369cb72c74406bf91cef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.1/agentsetup-v4.1.1-linux-arm64"
      sha256 "c55b35b79dd77d65403bd952d8b3d1713b91ffd9d84007a5a08c4ddfe76a372b"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.1/agentsetup-v4.1.1-linux-amd64"
      sha256 "ffd8ac303a73fb40d5533ce03249ca92035b6d7822d437bf5476f4b7782fde77"
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
