# baby evo

Mitsubishi Colt Ralliart Version-R (`Z27AG`) project: 1.5L turbo (`4G15T`) CAD models, 3D-printed parts, ECU definitions/ROMs, and custom telemetry.

## Layout

- `project_files/` — FreeCAD source files (shifter, exterior)
- `bin/export/` — exported parts (STEP/STL/3MF)
- `bin/roms/` — ECU ROMs
- `src/definitions/` — ECU XML definitions
- `docs/` — documentation sources rendered with Quarto

## Docs

Documentation is rendered with [Quarto](https://quarto.org). From the devshell:

```sh
just quarto-preview   # live preview on port 6660
just quarto-render    # render site to _output/
```
