# co3 — command line interface for the CO3 API

Install it, and every release of it, from here. The tool talks to the
[CO3 API](https://docs.co3.tech): assets, tracking, telematic connections, tachograph files.

```bash
# macOS and Linux
brew tap CO3-Tech/co3-cli
brew trust CO3-Tech/co3-cli    # Homebrew 6 will not load a formula from an untrusted tap
brew install co3

# Windows
scoop bucket add co3 https://github.com/CO3-Tech/homebrew-co3-cli && scoop install co3

# anywhere Node is already installed
npm install -g co3-cli
```

Then set up credentials once and make a call:

```bash
co3 context create          # asks for an environment, a client id and a secret
co3 assets list-trackable
```

Every route above installs the same executable. It carries its own runtime, so there is
nothing to install beside it — no Node, no `node_modules`. That holds for the npm package too:
the Node you install *with* is not a Node the tool then runs *on*.

## Downloading it yourself

Every [release](../../releases) carries an archive per platform and a `SHA256SUMS` file.

```bash
tar -xzf co3_<version>_darwin-arm64.tar.gz
shasum -a 256 -c co3_<version>_SHA256SUMS
./co3 --version
```

| platform | archive |
|---|---|
| macOS, Apple silicon | `co3_<version>_darwin-arm64.tar.gz` |
| macOS, Intel | `co3_<version>_darwin-x64.tar.gz` |
| Linux x86-64 | `co3_<version>_linux-x64.tar.gz` |
| Linux arm64 | `co3_<version>_linux-arm64.tar.gz` |
| Windows x86-64 | `co3_<version>_windows-x64.zip` |

On macOS, an archive taken from this page in a browser carries a quarantine flag, and these
executables are not signed with an Apple Developer ID — so the first run is blocked. Drop the
flag with `xattr -d com.apple.quarantine ./co3`. Homebrew and `gh` downloads never carry it.

## While this repository is private

Nothing above works yet. Homebrew, Scoop and a plain download all fetch from this repository's
releases, and those are only readable by people with access to it. The formula and the manifest
here are already the ones for the current release, so the day this repository is made public,
every command on this page starts working with nothing further to publish.

## What is here

| file | what it is |
|---|---|
| `Formula/co3.rb` | the Homebrew formula |
| `bucket/co3.json` | the Scoop manifest |
| releases | the executables, one archive per platform, and their checksums |

Both files are generated and pushed by the release pipeline in
[CO3-Tech/co3-api-toolkit](https://github.com/CO3-Tech/co3-api-toolkit), and each carries the
checksums of one release. A hand edit is overwritten by the next release and, until then,
describes bytes nobody published.

## Documentation, and asking for help

Using the CLI — contexts, commands, output formats, exit codes: the readme inside the
[release archives](../../releases/latest), or `co3 --help`.

The API itself, and how to obtain a client id and secret: [docs.co3.tech](https://docs.co3.tech).

Licensed Apache-2.0. The executables redistribute other people's work as well; `LICENSE`,
`NOTICE` and `THIRD-PARTY-NOTICES.md` travel inside every archive and every package.
