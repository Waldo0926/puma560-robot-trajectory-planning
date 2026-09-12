%% PUMA 560 draws a planar letter E
projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(projectRoot);
setup_project();

waypoints = generateLetterE(1.0);
trajectory = planCartesianTrajectory(waypoints, [0.5, 0.5, 0.3], 0.02, 0.20);

figure('Name', 'Letter E Cartesian Path');
plot3(trajectory(:, 1), trajectory(:, 2), trajectory(:, 3), 'LineWidth', 1.5);
axis equal; grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Interpolated letter E path');

simulatePuma560Path(trajectory, 0.10, [0.40, 0.00, 0.00], true);
