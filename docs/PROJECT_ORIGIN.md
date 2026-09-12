# Project origin and refactoring notes

## Origin

This repository is based on robotics laboratory work and a university course-design assignment completed in 2023–2024. The original work covered rigid transformations, robot modelling, kinematics, trajectory planning, and PUMA 560 path simulation in MATLAB.

The public repository is intentionally **not** a raw dump of the course folder. The source archive also contained lecture slides, a textbook PDF, reference-answer documents, temporary Office files, and personal academic reports. Those materials are either excluded entirely or kept only in the local, Git-ignored private archive.

## Why refactor the code?

Several patterns in the original submission were appropriate for a one-off assignment but not for a public software portfolio:

1. A MATLAB file mixed a function definition with interactive top-level input code.
2. The Euler-angle variables were named `alpha`, `beta`, and `gamma`, while the actual multiplication used a different axis association than the input prompts implied.
3. The Z-Y-Z inverse equations were not clearly tied to the same convention used by the forward transform.
4. A verification fragment mixed MATLAB `rigidBodyTree` concepts with Peter Corke `Link` / `SerialLink` APIs.
5. Robot drawing examples repeated substantial blocks of code rather than separating path generation, interpolation, and simulation.
6. Personal identifiers were embedded in the original reports and filenames.

The refactor therefore treats the coursework as the **technical provenance**, while presenting the repository as a maintainable, explicit, reproducible codebase.

## Public / private boundary

Public Git content includes:

- refactored source code;
- runnable examples;
- lightweight tests;
- selected screenshots produced in the author's original report;
- concise descriptions of the experiments.

The local-only `private-original-reports/` directory contains the author's original reports for provenance and is ignored by Git because the documents include personal academic information.

The original textbook, lecture slides, and reference-answer documents are not copied into this project package.
