%% PUMA 560 follows a C-shaped Cartesian path
projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(projectRoot);
setup_project();

waypoints = generateLetterC(1.0, 80);
trajectory = planCartesianTrajectory(waypoints, [1.0, 1.0, 0.8], 0.05, 0.30);

figure('Name', 'Letter C Cartesian Path');
plot3(trajectory(:, 1), trajectory(:, 2), trajectory(:, 3), 'LineWidth', 1.5);
axis equal; grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Interpolated letter C path');

simulatePuma560Path(trajectory, 0.10, [0.40, 0.00, 0.00], true);
