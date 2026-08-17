# CO3 Homebrew tap

Homebrew formulae for CO3 command-line tools.

```bash
export HOMEBREW_GITHUB_API_TOKEN=<a token with read access to CO3-Tech>
brew tap CO3-Tech/tap
brew install co3
```

The token is required because both this tap and the repositories it downloads from are
private. Homebrew reads it from the environment at download time; it is never written into
a formula. Keep it in your shell profile, or `brew upgrade` will not be able to fetch new
versions either.

## What is here

| formula | source |
|---|---|
| `co3` | [CO3-Tech/co3-api-toolkit](https://github.com/CO3-Tech/co3-api-toolkit) — command-line interface for the CO3 API |

## Do not edit the formulae by hand

`Formula/co3.rb` is generated and pushed by the release pipeline in `co3-api-toolkit`, from
`.github/homebrew/co3.rb.tmpl` there. It carries the numeric GitHub asset ids and the
checksums of a specific release, so a hand edit is overwritten by the next release and, in
the meantime, describes bytes nobody published.
