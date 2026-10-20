# Generated for co3 1.0.5. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.5/co3_1.0.5_darwin-arm64.tar.gz"
      sha256 "3e6b54e166cd337ec5c09d24aa4083dfc5522f0e83190e360e701b615747183f"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.5/co3_1.0.5_darwin-x64.tar.gz"
      sha256 "bdf17103a2e4c97edaf1cb4391becd28663d4c26340522c8ba21e9e741b6e22d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.5/co3_1.0.5_linux-arm64.tar.gz"
      sha256 "f00684a1d222844b66b68ae73e0c758640112c6dfbabb092444baeb9caa41363"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.5/co3_1.0.5_linux-x64.tar.gz"
      sha256 "ffb29bbe5f84a58c789ff0390856c7cd0805e1649299aa2c83f486d4320e50d1"
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
