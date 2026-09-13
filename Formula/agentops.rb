class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.0.0/agentops-v1.0.0-darwin-arm64"
      sha256 "6ccb5f8bfd7710893fa902cb1e1d0901b590ccc31c66a4bea221feaa2c152ade"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.0.0/agentops-v1.0.0-darwin-amd64"
      sha256 "9958f6d317fab174f55668136f23691aa2ac7cf12d067c25a741486522d97e55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.0.0/agentops-v1.0.0-linux-arm64"
      sha256 "7c32efee2384a35cfba3bd234c4186603cfa9a25c62f3b7c6f5ee0434eba4aac"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.0.0/agentops-v1.0.0-linux-amd64"
      sha256 "c81227dbfffec90f36683cbcaf2783acdd661b6661f5d3bd5fc99e4412563276"
    end
  end

  def install
    bin.install Dir["agentops-*"].first => "agentops"
    chmod 0755, bin/"agentops"
  end

  test do
    assert_match "Usage: agentops", shell_output("#{bin}/agentops --help")
  end
end
