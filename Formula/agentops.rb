class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.2.0/agentops-v1.2.0-darwin-arm64"
      sha256 "f5f6aec99811ab8dd3c881d3796535fa3e04f2a91476a34b1a11ba372d8e797d"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.2.0/agentops-v1.2.0-darwin-amd64"
      sha256 "d6e54d9277e0567ed55105befbb29fb6f4abf8c9195b51c220ac3ab0e666c3eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.2.0/agentops-v1.2.0-linux-arm64"
      sha256 "c642d77f467ecaea986311fbd85d10a4d497a3c381d8b8b94161edfa90c1759a"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.2.0/agentops-v1.2.0-linux-amd64"
      sha256 "ef7c104e9b5143b3e1b2bc299a73d555fa53e28a929ea047025db4b26b0d98af"
    end
  end

  def install
    bin.install Dir["agentops-*"].first => "agentops"
    chmod 0755, bin/"agentops"
  end

  test do
    assert_match "Available Commands:", shell_output("#{bin}/agentops --help")
    assert_match "AgentOps Version", shell_output("#{bin}/agentops version")
  end
end
