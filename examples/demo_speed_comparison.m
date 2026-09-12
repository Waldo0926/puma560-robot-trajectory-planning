%% Compare slow and fast Cartesian interpolation settings
projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(projectRoot);
setup_project();

waypoints = generateLetterE(1.0);

slowDt = 0.02;
fastDt = 0.05;
slowTrajectory = planCartesianTrajectory(waypoints, [0.5, 0.5, 0.3], slowDt, 0.20);
fastTrajectory = planCartesianTrajectory(waypoints, [1.0, 1.0, 0.8], fastDt, 0.50);

fprintf('Slow trajectory: %d samples, approximately %.2f s\n', ...
    size(slowTrajectory, 1), size(slowTrajectory, 1) * slowDt);
fprintf('Fast trajectory: %d samples, approximately %.2f s\n', ...
    size(fastTrajectory, 1), size(fastTrajectory, 1) * fastDt);

figure('Name', 'Trajectory Speed Comparison');
plot3(slowTrajectory(:, 1), slowTrajectory(:, 2), slowTrajectory(:, 3), 'LineWidth', 1.5);
hold on;
plot3(fastTrajectory(:, 1), fastTrajectory(:, 2), fastTrajectory(:, 3), '--', 'LineWidth', 1.5);
hold off;
axis equal; grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
legend('Slow settings', 'Fast settings', 'Location', 'best');
title('Same geometric path with different interpolation settings');
