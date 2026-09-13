# homebrew-tap

Homebrew tap for a firmware and IoT analysis toolkit.

## Install

```sh
brew install nmatt0/tap/moria      # firmware/IoT image identification and extraction
brew install nmatt0/tap/mithril    # firmware content analysis: secrets, SBOM, CVEs, licenses
```

The fully-qualified name taps automatically. You can also tap first, then use
the short names:

```sh
brew tap nmatt0/tap
brew install moria mithril
```

Homebrew may ask you to confirm installing from a third-party (non-core) tap the
first time; approve it. Upgrade later with `brew upgrade moria mithril`.

## Formulae

- **moria** (https://github.com/nmatt0/moria) identifies files and embedded
  content in firmware images and extracted rootfs trees, and can extract common
  embedded filesystems, archives, and boot/image containers.
- **mithril** (https://github.com/nmatt0/mithril) analyzes the contents of an
  unpacked firmware tree for secrets, a software bill of materials, known CVEs,
  and open-source licenses. It pairs with moria.

Both build from source from their tagged GitHub releases.
