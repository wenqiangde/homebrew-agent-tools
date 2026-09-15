class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.1/agentops-v1.3.1-darwin-arm64"
      sha256 "3ae64182f3ce2b57c8a3c246e33de5b475c40eeb007effc4d4ab925bc961f6d0"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.1/agentops-v1.3.1-darwin-amd64"
      sha256 "6fc12b32bd4745547b949f5160e149dfd585b1badde4d9c2f61e5e853140a49d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.1/agentops-v1.3.1-linux-arm64"
      sha256 "de011406ddca6417939906ed0756b947fe6b6ef3e6d2c918ffbaf290386625c8"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.3.1/agentops-v1.3.1-linux-amd64"
      sha256 "03dd1cdb8826cc5caaab70e85d9fdc9db041ef40fb6fab1d3db34a86f5f12a66"
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
