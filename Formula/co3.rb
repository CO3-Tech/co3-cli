# Generated for co3 1.0.3. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.3/co3_1.0.3_darwin-arm64.tar.gz"
      sha256 "531c08e157dc4b7cf1b8250b16b342d17672937d6eebf6a961dcce7fccd78869"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.3/co3_1.0.3_darwin-x64.tar.gz"
      sha256 "a8ec0cc766691ed155c20d9d56c5437e619d895402c39394e31543307274fc7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.3/co3_1.0.3_linux-arm64.tar.gz"
      sha256 "6c4f6adf519e8aaaf2c87eeaadf5c5092814a3f7e2ef47af69e871d8526d5b41"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.3/co3_1.0.3_linux-x64.tar.gz"
      sha256 "046338286a97374de6f94accbf79f7b9d9efd6a2fa43e7f3d41e0d054b039024"
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
