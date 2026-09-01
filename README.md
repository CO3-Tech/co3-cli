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

Every release below carries one archive per platform — macOS and Linux on both architectures,
musl included, and Windows — with a `SHA256SUMS` file to check them against.

[Downloading and verifying an archive →](https://docs.co3.tech/tools/cli/install)

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
parameters the API declares and the examples it publishes.

The documentation is at **[docs.co3.tech/tools](https://docs.co3.tech/tools)**:
installing, contexts and where your credentials rest, output formats, exit codes to branch on in
a script, relative date windows, pagination, and a command reference by area. It also covers
connecting an AI client to our hosted MCP service, which reaches the same API with the same
credentials.

`MANUAL.md` travels beside the executable in every archive and every npm package, for when you
have the download and not the browser.

The API itself, and how to obtain a client id and secret:
**[docs.co3.tech](https://docs.co3.tech)**.

## Licence

Apache-2.0. The executables carry other people's work as well — `LICENSE`, `NOTICE` and
`THIRD-PARTY-NOTICES.md` travel inside every archive and every package.
