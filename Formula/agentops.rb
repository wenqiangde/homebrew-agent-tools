class Agentops < Formula
  desc "Service inventory, health, deployment, rollback, and backup operations"
  homepage "https://github.com/wenqiangde/agentops"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.1.0/agentops-v1.1.0-darwin-arm64"
      sha256 "434e0f86a80c3acc393b56a8d21a68d118a134214f6efa1de95317bc3ed31902"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.1.0/agentops-v1.1.0-darwin-amd64"
      sha256 "3698ebc28bc1a7b9efbefea1c4b1a1d567f83611d57eed730936f09df9d47a59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/agentops/releases/download/v1.1.0/agentops-v1.1.0-linux-arm64"
      sha256 "8cbd961ed25b485ccd515bc35fa33ed740643d46929e33aced3ca1cc141cf3ba"
    else
      url "https://github.com/wenqiangde/agentops/releases/download/v1.1.0/agentops-v1.1.0-linux-amd64"
      sha256 "9c9ba8c9aeec2b6b78255d311dfefe704b35b70740301ad8492cf3579c060994"
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
