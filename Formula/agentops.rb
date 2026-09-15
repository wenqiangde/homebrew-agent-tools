class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.0/agentops-v1.3.0-darwin-arm64"
      sha256 "a39922982662caeaa0c25de4003cdafe8eb09e2991251ca7ce4e5d7d7138dce1"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.0/agentops-v1.3.0-darwin-amd64"
      sha256 "5dcc137957866487584c33e748b2fe0fded69d6c195f9fac0c075dd472278aa4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.0/agentops-v1.3.0-linux-arm64"
      sha256 "dc054251a94ed52790bc69b05a416af76c83837916523ce57dc3e7e966450903"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.0/agentops-v1.3.0-linux-amd64"
      sha256 "4bbcd3737a4a9a331f586acc04589867dbbc8a51b6a398c2411309dd680b0fde"
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
