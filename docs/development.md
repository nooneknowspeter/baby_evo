# Development

## Environment

The project uses a Nix flake with direnv (`.envrc` → `use flake .`). Entering the
directory provides Zig, FreeCAD, OrcaSlicer, Quarto, and the formatting tools.

Available devshells:

- `nix develop` — default: everything (CAD, docs, formatting)
- `nix develop .#docs` — docs toolchain only (Quarto + pandoc)
- `nix develop .#fmt` — formatters only

## Tasks

Common tasks are defined in the `justfile`:

```sh
just                  # list available recipes
just quarto-preview   # live preview on port 6660
just quarto-render    # render site to _output/
just format           # format sources with treefmt
just lint             # check formatting with treefmt
```

## CAD workflow

- Source models live in `project_files/` (FreeCAD `.FCStd`)
- Exported parts (STEP/STL/3MF) go to `bin/export/<part>/`
- Slice with OrcaSlicer for printing
