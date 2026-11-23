# baby evo

Mitsubishi Colt Ralliart Version-R (`Z27AG`) project: 1.5L turbo (`4G15T`) CAD models, 3D-printed parts, ECU definitions/ROMs, and custom telemetry.

## Vehicle Overview

| Parameter            | Specification                                                           |
| :------------------- | :---------------------------------------------------------------------- |
| **Chassis**          | Mitsubishi Colt Ralliart Version-R (`Z27AG`)                            |
| **Engine**           | 1.5L DOHC MIVEC Turbo (`4G15T`)                                         |
| **Transmission**     | Getrag 5-Speed Manual (`F5MGA`) with Concentric Slave Cylinder (CSC)    |
| **Drivetrain**       | Front-Wheel Drive (`4×114.3` lug pattern)                               |
| **Build Philosophy** | Factory-Plus reliability, OEM+ JDM aesthetics, custom CAN/OBD telemetry |

---

## Current Modifications

### Engine, Induction & Fueling

- **Turbocharger**: Stock Mitsubishi `TF035`
- **Intercooler**: Aftermarket Front-Mount Intercooler (`FMIC`) with custom M8 mounting hardware
- **Intake**: `Blitz` high-flow air filter
- **Boost Control**: 3-port electronic boost control solenoid
- **Fuel Injectors**: Subaru `WRX` injectors
- **Fuel Pump**: `AEM` high-flow in-tank fuel pump
- **Exhaust**: Decatted OEM downpipe and OEM exhaust piping routed to a rear muffler

### ECU & Tuning Tooling

- **Interface**: `Tactrix OpenPort 2.0`
- **Calibration & Logging**: `EcuFlash` and `EvoScan`
- **Binary Analysis**: Reverse engineering and ROM disassembly via `Ghidra` and `xxd`

### Chassis, Wheels & Brakes

- **Wheels**: 15-inch 6-spoke TE37-style deep-lip alloy wheels (`4×114.3`)
- **Tires**: `195/50R15` Pace Alventi
- **Rotors**: Drilled and slotted discs front (`280 mm` ventilated) and rear
- **Braking Maintenance**: Full brake system overhaul completed; slide pins serviced with 100% synthetic silicone grease (`KEZE`)

### Drivetrain & Interior Controls

- **Shifter Linkage**: OEM Getrag `F5MGA` shifter cage refreshed with added shim washers, E-clip tensioning, and synthetic silicone grease on the pivot cup
- **Service & Body**: Engine bay detailing completed; custom hood release cable fabricated

---

## Future Modifications & Roadmap

### Phase 1: Immediate Mechanical & Hydraulic Reliability

- **Clutch Hydraulics**: Full clutch line bleed using fresh `DOT 4` fluid to eliminate residual `CSC` air pockets and `1st`/`2nd` gear drag
- **Cooling System**:
  - OEM-spec `82°C` thermostat (installed with jiggle pin clocked at 12 o'clock)
  - `B24L` / `NS60L` JIS pencil-post battery (`~238 mm` length)
- **Lubrication & Hardware**: `GReddy` Neodymium Magdrain `MD-02` (`M14 × 1.5`) magnetic engine oil drain plug
- **Front End Completion**: Final `FMIC` bracket alignment and horn relocation

### Phase 2: Suspension, Drivetrain & Braking Precision

- **Suspension**: Coilover suspension upgrade (`Tein` as primary option)
- **Shifter Assembly**: Drop-in `Z27AG` / `CZT` / Smart ForFour Brabus (`W454`) RHD short-throw shifter cage assembly
- **Linkage Bushings**: Solid/urethane transmission-side cable-end bushings (`LAILE Beatrush S73232SCB` or `Dynodaze`) and solid shifter cage base bushings (`AIRTEC`)
- **Brake System Refinement** _(constrained to OEM `280 mm` front geometry for 15-inch barrel clearance)_:
  - High-friction fast-road pads (`Dixcel Type Z/ES`, `Project Mu B-Spec`, or `EBC Yellowstuff`)
  - Braided stainless steel brake lines

### Phase 3: Powertrain, Turbo & Exhaust Build

- **Engine Internals**: Forged internals (`4G15T` pistons and connecting rods)
- **Turbocharger**: Hybrid turbo upgrade pairing a `TD04` compressor side with a `TF035` exhaust side
- **Exhaust Manifold**: Direct bolt-in `TF035`-flange tubular headers
- **Exhaust System**: Full 3-inch turbo-back exhaust system featuring a resonator, rear muffler, and integrated wideband `O2` sensor bung/controller

### Phase 4: Exterior & OEM+ JDM Restoration

- **Front Aero**: `Blitz` Aero Speed R-Concept front bumper (`60130` / `60131`) fitted with custom mounting brackets while retaining the factory front crash beam
- **Badging & Lighting**:
  - Front grille emblem (`MN126476`, `~100 × 90 mm`) mounted with `3M VHB` tape
  - Side mirror courtesy puddle-light lens restoration and LED module verification

### Phase 5: Embedded Telemetry & Custom Electronics (`baby_evo`)

- **Real-Time Telemetry**: Low-latency `C++` CAN bus and OBD diagnostic/telemetry pipeline tailored for the `4G15T`
- **Custom Hardware**: `ESP32` / `FreeRTOS` sensor nodes and custom `FreeCAD` / `KiCad` enclosures for in-cabin monitoring

::: {.callout-note}

## Maintenance & Fitment Notes

- **Grease Compatibility**: Never use petroleum-based lithium grease on caliper slide pins, rubber boots, or nylon/Delrin shifter bushings; use 100% synthetic silicone grease exclusively.
- **Platform Cross-Reference**: Mechanical shifter and suspension parts cross-reference with the European **Mitsubishi Colt CZT** and **Smart ForFour Brabus (`W454`)**, not `4G63` Lancer Evolution (`CT9A`/`CN9A`) chassis components.

:::

---

## Layout

- `project_files/` — native project files (Blender, FreeCAD, or any other software)
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
