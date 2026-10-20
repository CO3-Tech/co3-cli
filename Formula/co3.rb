# Generated for co3 1.0.4. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.4/co3_1.0.4_darwin-arm64.tar.gz"
      sha256 "5fbbcc0d22b95f8f4539dd92f42f76195d07deea9d03aa152f7ff0383e968642"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.4/co3_1.0.4_darwin-x64.tar.gz"
      sha256 "03cce68814068aa6c81cf17ee50a68fd0ab9e5304b5249741cc8a0eb05188f76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.4/co3_1.0.4_linux-arm64.tar.gz"
      sha256 "40e831c9db31eb1d830697b5b415fc1c9c2b3012610147e49442c7ffa7cc71b3"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.4/co3_1.0.4_linux-x64.tar.gz"
      sha256 "e2c94cc3a2b53590c09b5a0c35d8147e0248c835a20694861d3b185976b7c7e5"
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
