class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.4/agentsetup-v4.1.4-darwin-arm64"
      sha256 "8f83e0ddce55cf3f4188bc44909e04e4e201295b64c554459a204d49bf4bc6b3"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.4/agentsetup-v4.1.4-darwin-amd64"
      sha256 "9cbfdb6be747aa3bb43ec8c68b7d7396146d480b9c2ea56ed6fb39c7e9b7e2d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.4/agentsetup-v4.1.4-linux-arm64"
      sha256 "eb544ec6dfefd7ff3a821693d4c705ab80f6c0080b871d3896add589e76b10ef"
    else
      url "https://github.com/wenqiangde/homebrew-agent-tools/releases/download/v4.1.4/agentsetup-v4.1.4-linux-amd64"
      sha256 "77ae62e8eca02c98d27fabb872f9bd9f0f93cffb87030851a4d0afda10c9c3b7"
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
