# co3 — command line interface for the CO3 API

Your fleet from a terminal: assets, tracking, telematic connections, tachograph files.
Everything the [CO3 API](https://docs.co3.tech) offers is a command, with its parameters as
flags, and output you can pipe.

```bash
co3 assets list-trackable
co3 assets get-details --assetIdentifier PLDWTEST122
co3 tacho-files list-driver-card --last-days 7
co3 assets list-trackable --output json | jq '.data | length'
```

## Installing

**macOS and Linux**

```bash
brew tap CO3-Tech/co3 https://github.com/CO3-Tech/co3-cli
brew trust CO3-Tech/co3
brew install co3
```

Homebrew will not load a formula from a tap you have not trusted, so the middle line is not
optional. It is a one-off, per machine. `brew upgrade co3` from then on, and tab completion
arrives with it.

**Windows**

```powershell
scoop bucket add co3 https://github.com/CO3-Tech/co3-cli
scoop install co3
```

`scoop update co3` from then on.

**Anywhere Node is already installed**

```bash
npm install -g @co3.tech/co3-cli
```

The Node you install *with* is not a Node the tool then runs *on*: what npm delivers is the
same self-contained executable as every other route. Works with `--ignore-scripts`.

**An archive, no package manager**

Take the one for your platform from the [latest release](../../releases/latest):

| platform | archive |
|---|---|
| macOS, Apple silicon | `co3_<version>_darwin-arm64.tar.gz` |
| macOS, Intel | `co3_<version>_darwin-x64.tar.gz` |
| Linux x86-64 | `co3_<version>_linux-x64.tar.gz` |
| Linux arm64 | `co3_<version>_linux-arm64.tar.gz` |
| Linux x86-64, musl (Alpine) | `co3_<version>_linux-x64-musl.tar.gz` |
| Linux arm64, musl (Alpine) | `co3_<version>_linux-arm64-musl.tar.gz` |
| Windows x86-64 | `co3_<version>_windows-x64.zip` |

```bash
tar -xzf co3_<version>_darwin-arm64.tar.gz
shasum -a 256 -c co3_<version>_SHA256SUMS
./co3 --version
```

On macOS, an archive taken from this page in a browser carries a quarantine flag, and these
executables are not signed with an Apple Developer ID — so the first run is blocked. Drop the
flag with `xattr -d com.apple.quarantine ./co3`. Homebrew and `gh` downloads never carry it.

## Your first call

```bash
co3 context create          # asks for an environment, a client id and a secret
co3 assets list-trackable
```

A context is a name for an environment and the credentials to use there, kept together, so no
command can reach production carrying development credentials. Your client id and secret are
the ones you already use against the API — nothing new to request, and no browser login.

`co3 context create` asks for each value in turn and never echoes the secret. Pass them all as
flags instead and it asks nothing, which is how it works in a pipeline:

```bash
co3 context create ci --env prod --client-id <id> --client-secret-env CO3_PROD_SECRET
```

Mark a context read-only and every state-changing command through it is refused before
anything is sent — worth doing on the one pointing at production:

```bash
co3 context read-only prod
```

## Learning the rest

`co3 --help` lists the command groups; `co3 <group> <command> --help` describes one, with the
parameters the API declares and the examples it publishes. The full readme travels inside every
release archive: contexts, output formats, exit codes to branch on in a script, relative date
windows, pagination, and where your credentials rest on disk.

The API itself, and how to obtain a client id and secret: **[docs.co3.tech](https://docs.co3.tech)**.

## Licence

Apache-2.0. The executables carry other people's work as well — `LICENSE`, `NOTICE` and
`THIRD-PARTY-NOTICES.md` travel inside every archive and every package.
