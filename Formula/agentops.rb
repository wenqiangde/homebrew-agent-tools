class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.0/agentops-v1.4.0-darwin-arm64"
      sha256 "8edd94c14b8260b4bb628312f905214f35ca7703a8e7794708946654eef6ea17"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.0/agentops-v1.4.0-darwin-amd64"
      sha256 "badc2aff631adb05c1e6e7a8b48fa59f4e531e80dbdddabe010d08d32fc9cd8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.0/agentops-v1.4.0-linux-arm64"
      sha256 "56bd8da3efb10ca01dcd454ee7d00061d3ef0b0f7a906c58f26b58fbbf81491f"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.4.0/agentops-v1.4.0-linux-amd64"
      sha256 "16695961986125fb1249ec67832ac4a4512d73c6c21b4e02f7b83cb8dbd5fc96"
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
