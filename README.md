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

## tmux fork

The optional tmux fork lives in `Formula/tmux.rb`:

```bash
brew install edihasaj/tap/tmux
```

This formula preserves the 3.6b fork with its copy-mode crash fix. Keep an
existing Homebrew core tmux installation unless you need that specific fork.
