# Generated for co3 1.0.6. Edits are overwritten by the next release.
class Co3 < Formula
  desc "Command-line interface for the CO3 API"
  homepage "https://docs.co3.tech"
  version "1.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.6/co3_1.0.6_darwin-arm64.tar.gz"
      sha256 "01eaa216985c6ad3dab153a547a844391bdb7079366d6372f8934cf185564ff0"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.6/co3_1.0.6_darwin-x64.tar.gz"
      sha256 "b6cc66b22eba1d621f27fbac1a355dd146622637a9b2f7d2b0c6c8fd805634c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.6/co3_1.0.6_linux-arm64.tar.gz"
      sha256 "f909f40a295cf5eb3e450c08a8e81f4c5d56825e228723f3d9018a9d89f02432"
    end
    on_intel do
      url "https://github.com/CO3-Tech/co3-cli/releases/download/v1.0.6/co3_1.0.6_linux-x64.tar.gz"
      sha256 "1d97f015ca569c99d90b22f454e5e36a4f33904e80a7c4d303c21851e7cb8025"
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
