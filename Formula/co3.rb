# Generated for co3 0.1.1. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v0.1.1/co3_0.1.1_darwin-arm64.tar.gz"
      sha256 "583ffefbf0ed111e961b86ca6ffb7592692be3ac7d6a9274365191615dfc3dbf"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v0.1.1/co3_0.1.1_darwin-x64.tar.gz"
      sha256 "4d6fe0007176a6775318b6dcb7628e8541b21404abd7bfef07cdc0799c313cc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v0.1.1/co3_0.1.1_linux-arm64.tar.gz"
      sha256 "4ec5af2532c10aaba5e9fb415c8f6b1ba5ef8e16740ab42a977592f1f6df2c39"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v0.1.1/co3_0.1.1_linux-x64.tar.gz"
      sha256 "00d4b3c09d840b81eb661c87f740ebe21baa4b2df6c5f5e166c0def4d9d0966e"
    end
  end

  def install
    bin.install "co3"

    # From the CLI itself, so a shell learns about a command the moment the release
    # carries it. A completion generated at packaging time would be a second source.
    generate_completions_from_executable(bin/"co3", "completion")
  end

  def caveats
    <<~EOS
      Set up a context before the first call:

        co3 context create
    EOS
  end

  test do
    # Runs the binary and asserts the version it reports, which also catches an archive
    # assembled for the wrong platform.
    assert_match version.to_s, shell_output("#{bin}/co3 --version")
  end
end
