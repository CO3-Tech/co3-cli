# Generated for co3 1.0.0. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_darwin-arm64.tar.gz"
      sha256 "721b7a9d6ffdc97f93f5e0e2150c8b9d104e76b7471d9b8fb4a2703edcfe1308"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_darwin-x64.tar.gz"
      sha256 "c62a507b26e98d5e7252fe6270c35e3470bc2b59db9f18a1d0f8161555cbec2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_linux-arm64.tar.gz"
      sha256 "8e935adfb081d65cc25cf869dee04682b420c7f03c3f2d4bcb966a3aab3fb199"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_linux-x64.tar.gz"
      sha256 "734af3ef5c64433513d9a21bfa1a0ba478421ceadbc1e67c7494dba8b078882a"
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
