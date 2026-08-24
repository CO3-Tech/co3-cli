# Generated for co3 1.0.1. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.1/co3_1.0.1_darwin-arm64.tar.gz"
      sha256 "52a9687566527472597ade37f040ffd7c90f20f932001d22a28f0bd55039f89b"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.1/co3_1.0.1_darwin-x64.tar.gz"
      sha256 "0f83b92667ccc573a68c04ac014f66eb807131c3ddb1c4cd4ac120c03016ba45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.1/co3_1.0.1_linux-arm64.tar.gz"
      sha256 "e71ed2ad22e0a1d90631df4a420309d83a57bc4bcdef380cb6ecda25cb5965ee"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.1/co3_1.0.1_linux-x64.tar.gz"
      sha256 "5f5c8511c7e73b1a7a2fcd5c6b2095a33948ab90e8ffc86ba56d15d01d69f782"
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
