# Generated for co3 1.0.8. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.8/co3_1.0.8_darwin-arm64.tar.gz"
      sha256 "c19eda69bcdfdc80e38c0bd3a5f2dba37d8a5dbd8f7bb5a082f294fab719506f"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.8/co3_1.0.8_darwin-x64.tar.gz"
      sha256 "7c3213642a107d0cb2d62d6e9cfcbb0bc406857dd4f4e5cf4d878f664b700d68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.8/co3_1.0.8_linux-arm64.tar.gz"
      sha256 "40014795317f36c4fce5993494eb4d2edee5baf3ef699731c3cae761b3fb5ba1"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.8/co3_1.0.8_linux-x64.tar.gz"
      sha256 "352d8d86cf0eb52711b347a0bd9875068f7f8a9189567a3a0f3fcdab41e4d402"
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
