class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "0.1.0"
  license "Apache-2.0"

  on_darwin do
    on_arm do
      url "https://github.com/CO3-Tech/homebrew-co3-cli/releases/download/v0.1.0/co3_0.1.0_darwin-arm64.tar.gz"
      sha256 "545ea97a1c7edbf8f55e56771191956151ad2cc356cb4e90422c945a5c3730e2"
    end
    on_intel do
      url "https://github.com/CO3-Tech/homebrew-co3-cli/releases/download/v0.1.0/co3_0.1.0_darwin-x64.tar.gz"
      sha256 "1bbe32d96ba39fc8cd0baff2b82c20763faeaa85bc2e9ae3a4308a13a3f00387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/homebrew-co3-cli/releases/download/v0.1.0/co3_0.1.0_linux-arm64.tar.gz"
      sha256 "9592b9b6295c59ea4d6922a4a55ba5ab70d78215893b766f3ae61fa966d5e0d1"
    end
    on_intel do
      url "https://github.com/CO3-Tech/homebrew-co3-cli/releases/download/v0.1.0/co3_0.1.0_linux-x64.tar.gz"
      sha256 "8390d399c7c3fe6a4e871e4c4f0a57c0e673f1ab197d9cca6115200cac443235"
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
