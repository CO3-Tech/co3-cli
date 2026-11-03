# Generated for co3 1.0.7. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.7/co3_1.0.7_darwin-arm64.tar.gz"
      sha256 "4129a8f6d45a958da3146ab47c5b528841d353e180b2431f9019ae156f2e1649"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.7/co3_1.0.7_darwin-x64.tar.gz"
      sha256 "ded34c96544c7e96bc9a26df0728c91f719e70273331b764edd243ab7c967207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.7/co3_1.0.7_linux-arm64.tar.gz"
      sha256 "ca9818d5ed60b2716f92d97e768993c0e7cc48dae6fb7ebc02d540efaea8ded9"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.7/co3_1.0.7_linux-x64.tar.gz"
      sha256 "71deab7e92e50eebae7b75be185f35257f9ef7f5118f8f12e5b799e17ae98fd3"
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
