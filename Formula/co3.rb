# Generated for co3 1.0.2. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.2/co3_1.0.2_darwin-arm64.tar.gz"
      sha256 "2f610b54a6cf7eb0583fa2cc87847452d37b44abd94dbda4dde7594ec0072bba"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.2/co3_1.0.2_darwin-x64.tar.gz"
      sha256 "df5d97e2c7208826a4d3919f668fcffc13c99e605c9c32fda5d55e7c9dbe7e62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.2/co3_1.0.2_linux-arm64.tar.gz"
      sha256 "8c2411cf5ee273ec8f4442a815bdb06907a69645e10721995fe02229e1b152b3"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.2/co3_1.0.2_linux-x64.tar.gz"
      sha256 "2d10d0736afcca9a9174186d27d9e9a6df5005a6c11b267843a8b2204aed5faf"
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
