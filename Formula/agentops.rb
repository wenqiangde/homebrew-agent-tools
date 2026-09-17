class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v2.0.0/agentops-v2.0.0-darwin-arm64"
      sha256 "3a42cf7554f7d93ba35448fea7e1697eae5990ab633efeddb2ccca24dcb0e70b"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v2.0.0/agentops-v2.0.0-darwin-amd64"
      sha256 "347e8a242c8010af1f3a02a922ae6de9ae777677beef34c9c5766e9c4f9db843"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v2.0.0/agentops-v2.0.0-linux-arm64"
      sha256 "9efb8fd045acef1bf3c975ebca4afca48717a443340778fbf7ba080a80b20c08"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v2.0.0/agentops-v2.0.0-linux-amd64"
      sha256 "f48f25f0c1b41bf633bcfee010678f2625abee718e5d62ac676f2efdd0130d22"
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
