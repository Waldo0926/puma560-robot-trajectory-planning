# Requirements

This is a MATLAB project, so a Python-style `requirements.txt` would be misleading. Runtime dependencies are documented here instead.

## Required

- **MATLAB** — a reasonably recent release with `arguments`, `deg2rad`, `rad2deg`, and standard plotting support.
- **Peter Corke Robotics Toolbox for MATLAB** — required by the robot / trajectory demos for functions and models such as:
  - `mdl_puma560`
  - `mstraj`
  - `transl`
  - `trotx`
  - `ikine6s`

Install and initialize the toolbox according to its official documentation before running the PUMA examples.

## Optional

- **MATLAB Robotics System Toolbox** — only used opportunistically by `examples/demo_rotation_conversion.m` to cross-check a result with `rotm2eul` when that function is available. It is not required for the core conversion functions.

## What can run without Peter Corke's toolbox?

The files under `src/transforms/` and `tests/run_tests.m` only rely on MATLAB base functionality and can be used independently.

## Compatibility note

The project was refactored from older coursework that used Peter Corke Robotics Toolbox APIs. Toolbox releases may differ in how pose sequences are represented. If your installed release changes the accepted representation for `transl(...)` or `ikine6s(...)`, adapt `src/robot/simulatePuma560Path.m` to that release rather than mixing APIs from MATLAB `rigidBodyTree` and Peter Corke `SerialLink`.
