<div align="center">

# fish-version 🔢

_test fish version_

[![CI](https://github.com/gazorby/fish-version/actions/workflows/ci.yml/badge.svg)](https://github.com/gazorby/fish-version/actions/workflows/ci.yml)

Test semver version numbers in your scripts

</div>

## ✨ Features

- Compare arbitrary [semver](https://semver.org/) compliant versions
- Test the installed fish version

## 🚀 Install

```fish
fisher install gazorby/fish-version
```

## 🔧 Usage

`fish_version_test` can be used in two forms:

- `fish_version_test -eq 3.0.0`

  Test that installed fish version matches 3.0.0

- `fish_version_test 3.1.0 -ne 0.1.3`

  Test arbitrary semver version numbers

In either case, the operator is expected to be a `test` number operator (`-eq`, `-ne`, `-gt` or `-lt`)

### Examples

```fish
# Test installed fish version
fish_version_test -gt 3.0.0
fish_version_test -lt 3.0.1
fish_version_test -eq 3.6.0
fish_version_test -ne 0.0.0

# Test arbitrary versions
fish_version_test 3.1.0 -gt 3.0.0
fish_version_test 3.0.0 -lt 3.0.1
fish_version_test 3.6.0 -eq 3.6.0
fish_version_test 0.0.1 -ne 0.0.0
```
