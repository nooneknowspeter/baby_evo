# baby evo

Mitsubishi Lancer Evolution project: CAD models, 3D-printed parts, and ECU definitions/ROMs.

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
