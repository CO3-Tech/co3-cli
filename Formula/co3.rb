# Generated for co3 1.0.9. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.9/co3_1.0.9_darwin-arm64.tar.gz"
      sha256 "873111df176d979f47a18df7f327f59a76c182681be432bbe07ede11e3e377e7"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.9/co3_1.0.9_darwin-x64.tar.gz"
      sha256 "dbe540a92974991f2c1b1a623843d13e62a24811457e37637e55863b8ae6105c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.9/co3_1.0.9_linux-arm64.tar.gz"
      sha256 "562c4554db9e4f43c0a793efb550715133a96b7e965d9d99c3b974b9dc5da35d"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.9/co3_1.0.9_linux-x64.tar.gz"
      sha256 "9d24d16f3eb0ce471a7450a981936abb7a030a106991df584fcf73df17f4793a"
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
