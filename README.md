# Homebrew tap: Disc CLI

Homebrew tap for installing the **Disc CLI**.

---

## Install

```bash
brew install disctechnologies/tap/disc
```

---

## Upgrade

```bash
brew update
brew upgrade disc
```

---

## Maintainers — Publishing a new version

### 1. Tag a new release in `disc-cli`

```bash
git tag vX.Y.Z
git push origin vX.Y.Z
```

This triggers CI to:

- build binaries
- publish GitHub Release
- generate:
  - `disc-*.tar.gz`
  - `SHA256SUMS.txt`
  - `disc.rb`

---

### 2. Update formula

Copy generated formula into this repo:

```bash
cp <path-to-generated>/disc.rb Formula/disc.rb
```

Commit and push:

```bash
git add Formula/disc.rb
git commit -m "disc vX.Y.Z"
git push
```

---

### 3. Verify

```bash
brew update
brew install disctechnologies/tap/disc
# or
brew upgrade disc
```

---

## Notes

- Release must be **public** and **not draft**
- Checksums must match exactly
- Formula must reference correct release asset URLs

---

## License

See upstream `disc-cli` repository.

