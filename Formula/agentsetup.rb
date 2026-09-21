class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.2/agentsetup-v4.1.2-darwin-arm64"
      sha256 "c298534f69df259aa3cd9a6aa6b0961307fe6a65380eea613485faf877b41f80"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.2/agentsetup-v4.1.2-darwin-amd64"
      sha256 "336db27215973eec8a9a48ebe67cc8a4a5e5617a63e812782cdf493d01b736bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.2/agentsetup-v4.1.2-linux-arm64"
      sha256 "6c94fcc6d81b90a3aa998c8320dbb821e9d865b738477950df1c1f80121e9409"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.2/agentsetup-v4.1.2-linux-amd64"
      sha256 "19b1e42b803e709c5b411c259abeef67f69b071f982b42a1be2b443f3981bea5"
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
