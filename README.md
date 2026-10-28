# template-c-utility

Template repository for creating compiled C utilities deployed via `sstix-tools` for **APT**, **RPM**, and **Nix** with **Zsh autocompletion** and multi-architecture binary releases (`amd64`, `arm64`).

## Repository Structure
```
├── .github/workflows/
│   ├── release.yaml             # Multi-arch compilation and packaging pipeline
│   └── test.yaml                # CI build matrix tests (GCC, Clang)
├── completion/
│   └── _template-c-utility      # Zsh completion definition
├── packaging/
│   ├── debian/                  # Debian package metadata (Architecture: any)
│   └── rpm/                     # RPM spec file
├── src/
│   └── main.c                   # C source code
├── Makefile                     # Standard build & install Makefile
├── LICENSE
└── README.md
```

## How to Use This Template
1. Create a new repository in GitHub from this template under the `sstix-tools` organization.
2. Rename the occurrences of `template-c-utility` to your tool name:
   - In `Makefile`: `NAME = <your-tool>`
   - `completion/_template-c-utility` -> `completion/_<your-tool>`
   - `packaging/rpm/template-c-utility.spec` -> `packaging/rpm/<your-tool>.spec`
   - In `.github/workflows/release.yaml`: update `pkg_name="<your-tool>"`
   - In `packaging/debian/control`: update `Package:` and `Description:`
3. Implement your C code in `src/`.
4. Test locally:
   ```bash
   make
   ./template-c-utility --help
   ```
5. Commit your changes and tag a release:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```
6. GitHub Actions will automatically cross-compile for `amd64` and `arm64`, build Debian (`.deb`), RPM (`.rpm`), and source tarball for Nix, and notify `sstix-tools/registry`.
