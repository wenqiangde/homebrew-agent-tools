class Agentsetup < Formula
  desc "Versioned distribution and setup tool for agent rules and skills"
  homepage "https://github.com/wenqiangde/agentsetup"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v4.0.0/agentsetup-v4.0.0-darwin-arm64"
      sha256 "c74dc51f71b8ec514099b7e9d6cd950b5c3061da08585ce32b71d822e74f5c10"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v4.0.0/agentsetup-v4.0.0-darwin-amd64"
      sha256 "cada6d58093bc771e991b20d9ca7884820c1751ea79c2bd64cdc018b31c7d770"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v4.0.0/agentsetup-v4.0.0-linux-arm64"
      sha256 "228e28bf8dc80acec4e6568473ac246f338d119d4f38b1882d2ab6347c95f36b"
    else
      url "https://github.com/wenqiangde/homebrew-agentsetup/releases/download/v4.0.0/agentsetup-v4.0.0-linux-amd64"
      sha256 "9727cb1ba10ba17725ecfd1fe8ee79991288c788aede889266a514b36afc3352"
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
