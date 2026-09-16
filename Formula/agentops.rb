class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.1/agentops-v1.4.1-darwin-arm64"
      sha256 "0263bb00903d466c1ee31c513181cde692caa7d7e80317012f619cab71bd8591"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.1/agentops-v1.4.1-darwin-amd64"
      sha256 "2accf35cf10242f8facc5c6029bfaa263905f34f8a2858de156d8d944f7e69fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.1/agentops-v1.4.1-linux-arm64"
      sha256 "6ec7aace0aa0625f3f6105790503b2a3a8732c3e788916e1a25dc21e53d9e0af"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.1/agentops-v1.4.1-linux-amd64"
      sha256 "ae5782344855f4cc074254a431383fa520fafbefeff1c871706a620f353b97e0"
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
