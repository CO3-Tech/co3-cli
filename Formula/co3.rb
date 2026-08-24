# Generated for co3 1.0.0. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_darwin-arm64.tar.gz"
      sha256 "c8414c2a48adb0ae766b41a029f4b244d0f7a64ecb827a142839140b546fcd8d"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_darwin-x64.tar.gz"
      sha256 "f255c6164b594116878ff663b92c7d8acde377367941ce17ee67b5a54341d55a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_linux-arm64.tar.gz"
      sha256 "2c1f55d3eea1bd207342ba4f01b648a7b21d7fd8f10afa736baa411f6007b2bf"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.0/co3_1.0.0_linux-x64.tar.gz"
      sha256 "02cf6dcad86da5a7fdcd90d30ef3baa108dbeeab33425f493cda93139db92a92"
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
