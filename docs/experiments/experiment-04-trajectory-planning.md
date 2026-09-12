# Experiment 04 — Robot trajectory planning

## Objective

The original laboratory exercise compared several trajectory-planning approaches in MATLAB and then applied them to PUMA 560 motion.

## Topics covered

- polynomial scalar trajectories with `tpoly`;
- joint-space trajectories with `jtraj`;
- Cartesian-space pose trajectories with `ctraj`;
- PUMA 560 inverse kinematics with `ikine6s`;
- position / velocity / acceleration profiles;
- a quintic single-joint trajectory with zero endpoint velocity and acceleration;
- a two-segment trajectory through an intermediate point with continuity constraints.

## Public-project connection

The course-design portion extends this material from point-to-point motion to multi-segment drawing paths. The refactored project therefore concentrates on:

1. generating geometric waypoints;
2. interpolating them with `mstraj`;
3. scaling and translating the path into a PUMA 560 workspace;
4. converting each Cartesian target pose into joint configurations;
5. visualizing the resulting robot motion.

`examples/demo_speed_comparison.m` also retains the original experiment idea of comparing trajectory settings while separating geometric path definition from timing parameters.
