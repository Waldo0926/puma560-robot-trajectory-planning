# Experiment 02 — Rotation and translation transformations

## Objective

The original laboratory exercise introduced rotation matrices and homogeneous transformations and used MATLAB robotics utilities to visualize rigid-body transforms.

## Topics covered

- rotations about the X, Y, and Z axes;
- composition of rotations;
- Z-Y-Z Euler representation and roll-pitch-yaw style composition;
- angle-axis representation;
- homogeneous translation and rotation composition;
- extracting rotation and translation components from a homogeneous transform;
- frame visualization and transform animation.

## Public-project connection

The reusable mathematics from this experiment is represented by the functions in `src/transforms/`. Instead of relying only on toolbox convenience functions, the project explicitly constructs and decomposes rotation matrices so that the adopted convention is visible in the code.

The original experiment also motivated one of the key refactoring goals: axis order, angle units, and multiplication order must be stated explicitly. Robotics code is especially error-prone when degree/radian assumptions or intrinsic/extrinsic conventions are implicit.
