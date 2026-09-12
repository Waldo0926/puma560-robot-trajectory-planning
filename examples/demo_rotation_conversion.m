%% Euler-angle and rotation-matrix conversion demo
projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(projectRoot);
setup_project();

zyxInputDeg = [45, 30, -20]; % [Z, Y, X]
R = eulerZYXToRotationMatrix(zyxInputDeg(1), zyxInputDeg(2), zyxInputDeg(3));
recovered = rotationMatrixToEuler(R);

fprintf('Input Z-Y-X angles [deg]:      %8.3f %8.3f %8.3f\n', zyxInputDeg);
fprintf('Recovered Z-Y-X angles [deg]:  %8.3f %8.3f %8.3f\n', recovered.ZYX.deg);
disp('Rotation matrix:');
disp(R);

% Optional cross-check with MATLAB Robotics System Toolbox if available.
if exist('rotm2eul', 'file') ~= 0
    toolboxZYXDeg = rad2deg(rotm2eul(R, 'ZYX'));
    fprintf('rotm2eul Z-Y-X [deg]:          %8.3f %8.3f %8.3f\n', toolboxZYXDeg);
else
    fprintf('rotm2eul is unavailable; skipping Robotics System Toolbox cross-check.\n');
end
