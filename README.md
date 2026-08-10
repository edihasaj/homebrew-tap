# Edi's Homebrew Tap

Homebrew casks and formulae for Edi Hasaj projects.

## Recall

After the first Recall release publishes its cask:

```bash
brew install --cask edihasaj/tap/recall
```

The Recall repository release workflow renders `Casks/recall.rb` with the release artifact SHA and pushes it here when `HOMEBREW_TAP_GITHUB_TOKEN` is configured.

## Shotport

```bash
brew install edihasaj/tap/shotport
shotport doctor
```

On macOS, the formula installs guiport automatically. Guiport remains the single
signed owner of Screen Recording and Accessibility permissions.
